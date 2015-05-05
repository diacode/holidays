class VacationRequestsController < ApplicationController
  def index
    @vacation_requests = VacationRequest.ordered.pending
  end

  def edit
    gon.vacation_request_id = params[:id]
  end
end
