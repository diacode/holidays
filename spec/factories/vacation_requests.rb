# == Schema Information
#
# Table name: vacation_requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#
# Indexes
#
#  index_vacation_requests_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :vacation_request do
    user nil
message "MyText"
  end

end
