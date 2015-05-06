class Api::V1::RequestedDaysController < ApplicationController
  before_action :set_vacation_request

  def create
    requested_day = @vacation_request.requested_days.build requested_day_params

    if requested_day.save
      render json: requested_day, status: :ok
    else
      render json: requested_day.errors, status: :unprocessable_entity
    end
  end

  def destroy
    requested_day = @vacation_request.requested_days.find params[:id]
    requested_day.destroy!

    render json: requested_day, status: :ok
  end

  def approve
    render json: false, status: 503 and return unless current_user.admin

    requested_day = @vacation_request.requested_days.find params[:id]
    requested_day.approved!

    render json: requested_day, status: :ok
  end

  def reject
    render json: false, status: 503 and return unless current_user.admin

    requested_day = @vacation_request.requested_days.find params[:id]
    requested_day.rejected!

    render json: requested_day, status: :ok
  end

  private

  def set_vacation_request
    @vacation_request = VacationRequest.find params[:vacation_request_id]
  end

  def requested_day_params
    if current_user.admin
      params.require(:requested_day).permit(
        :day,
        :status
      )
    else
      params.require(:requested_day).permit(
        :day
      )
    end
  end
end
