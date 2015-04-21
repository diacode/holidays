class VacationRequestsController < ApplicationController
  def index
    @vacation_requests = VacationRequest.ordered.pending
  end
end
