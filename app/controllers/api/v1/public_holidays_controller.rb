class Api::V1::PublicHolidaysController < ApplicationController
  def index
    public_holidays = load_public_holidays

    render json: public_holidays, root: :public_holidays
  end

  private

  def load_public_holidays
    if params[:date].present?
      PublicHoliday.by_month Date.parse(params[:date])
    else
      PublicHoliday.all
    end
  end
end
