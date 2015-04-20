# == Schema Information
#
# Table name: requested_days
#
#  id                  :integer          not null, primary key
#  day                 :date             not null
#  status              :integer          default(0)
#  vacation_request_id :integer          not null
#  validator_id        :integer
#  validated_at        :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_requested_days_on_vacation_request_id  (vacation_request_id)
#  index_requested_days_on_validator_id         (validator_id)
#

class RequestedDay < ActiveRecord::Base
  enum status: [:requested, :approved, :rejected]

  # Relations
  belongs_to :vacation_request
  belongs_to :validator, class_name: 'User'

  # Scope  
  scope :current_year, -> { from_year(Date.today.year) }
  scope :from_year, -> (year) { 
    date_obj = Date.strptime(year.to_s, '%Y')
    where(day: (date_obj.beginning_of_year..date_obj.end_of_year)) 
  }
end
