# == Schema Information
#
# Table name: vacation_requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vacation_requests_on_user_id  (user_id)
#

class VacationRequest < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :requested_days, dependent: :destroy, inverse_of: :vacation_request
  accepts_nested_attributes_for :requested_days, allow_destroy: true, reject_if: :all_blank

  validate :at_least_one_requested_day
  validate :valid_dates

  private

  def at_least_one_requested_day
    errors[:base] << 'At least one requested day is required' if requested_days.empty?
  end

  def valid_dates
    errors[:base] << 'Cant\'t select a date in the past' if requested_days.select{ |request_date| request_date.day.past? }.any?
  end
end
