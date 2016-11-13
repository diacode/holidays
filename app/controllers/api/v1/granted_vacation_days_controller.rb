class Api::V1::GrantedVacationDaysController < ApplicationController
  def batch_create
    GrantedVacationDay.create(build_insert_data)
    render json: true
  end

  private

  def build_insert_data
    insert_data = []

    amount = params[:batch][:amount].to_i
    year = params[:batch][:year].to_i
    reason = params[:batch][:reason]

    params[:batch][:user_ids].each do |user_id|
      amount.times do
        insert_data << {
          user_id: user_id,
          year: year,
          reason: reason
        }
      end
    end

    insert_data
  end
end
