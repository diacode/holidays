class Api::V1::VacationRequestsController < ApplicationController
  def index
    vacation_requests = VacationRequest.ordered

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

  private

  def vacation_request_params
    params.require(:vacation_request).permit(
      :message,
      requested_days_attributes: [
        :day
      ]
    )
  end
end
