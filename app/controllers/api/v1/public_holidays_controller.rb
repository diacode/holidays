class Api::V1::PublicHolidaysController < ApplicationController
  def index
    public_holidays = load_public_holidays

    render json: public_holidays, root: :public_holidays
  end

  def batch_create
    public_holidays_params = batch_params[:public_holidays]
    public_holidays = PublicHoliday.create(public_holidays_params)

    render json: public_holidays, root: :public_holidays, status: :ok
  end

  private

  def load_public_holidays
    return PublicHoliday.all unless params[:date].present?

    PublicHoliday.by_month Date.parse(params[:date])
  end

  def batch_params
    params.require(:public_holidays_params).permit(
       public_holidays: [
        :name,
        :day
      ]
    )
  end
end
