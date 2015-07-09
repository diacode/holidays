class Api::V1::VacationRequestsController < ApplicationController
  before_action :check_admin_user, only: [:approve, :reject]

  def index
    vacation_requests = VacationRequest.includes(:user, :requested_days).ordered.page params[:page]

    render  json: vacation_requests,
            meta: {
              current_page: vacation_requests.current_page,
              total_pages: vacation_requests.total_pages,
              total_count: vacation_requests.total_count
            }
  end

  def show
    vacation_request = VacationRequest.find params[:id]

    render json: vacation_request
  end

  def create
    vacation_request = current_user.vacation_requests.build vacation_request_params
    VacationRequestManager.new(vacation_request).create

    if vacation_request.persisted?
      render json: vacation_request.reload, status: :ok
    else
      render json: vacation_request.errors, status: :unprocessable_entity
    end
  end

  def update
    vacation_request = VacationRequest.find params[:id]

    vacation_request.attributes = vacation_request_params

    if vacation_request.save
      render json: vacation_request, status: :ok
    else
      render json: vacation_request.errors, status: :unprocessable_entity
    end
  end

  def approve
    vacation_request = VacationRequest.find params[:id]
    vacation_request_manager = VacationRequestManager.new vacation_request

    vacation_request_manager.approve

    render json: vacation_request, status: :ok
  end

  def reject
    vacation_request = VacationRequest.find params[:id]
    vacation_request_manager = VacationRequestManager.new vacation_request

    vacation_request_manager.reject

    render json: vacation_request, status: :ok
  end

  private

  def check_admin_user
    render json: false, status: :forbidden and return unless current_user.admin
  end

  def vacation_request_params
    if current_user.admin
      params.require(:vacation_request).permit(
        :message,
        :status,
        requested_days_attributes: [
          :day,
          :status
        ]
      )
    else
      params.require(:vacation_request).permit(
        :message,
        requested_days_attributes: [
          :day
        ]
      )
    end
  end
end
