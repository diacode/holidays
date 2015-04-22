class Api::V1::VacationRequestsController < ApplicationController
  def index
    vacation_requests = VacationRequest.pending.ordered

    render json: vacation_requests, root: :vacation_requests
  end

  def create
    vacation_request = current_user.vacation_requests.build vacation_request_params

    if vacation_request.save
      render json: vacation_request, status: :ok
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
    render json: false, status: 503 and return unless current_user.admin

    vacation_request = VacationRequest.find params[:id]
    vacation_request.approve!

    render json: vacation_request, status: :ok
  end

  private

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
