class Api::V1::PublicHolidaysController < ApplicationController
  def index
    public_holidays = load_public_holidays

    render json: public_holidays, root: :public_holidays
  end

  private

  def load_public_holidays
    return PublicHoliday.all unless params[:date].present?

    PublicHoliday.by_month Date.parse(params[:date])
  end
end
