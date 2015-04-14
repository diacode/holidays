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

FactoryGirl.define do
  factory :requested_day do
    vacation_request nil
date "2015-04-14"
status 1
validator nil
validated_at "2015-04-14 17:19:54"
  end

end
