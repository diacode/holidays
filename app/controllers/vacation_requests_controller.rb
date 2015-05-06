class VacationRequestsController < ApplicationController
  def index
  end

  def edit
    gon.vacation_request_id = params[:id]
  end
end
