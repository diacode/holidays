# == Schema Information
#
# Table name: granted_vacation_days
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  reason     :text
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_granted_vacation_days_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :granted_vacation_day do
    user nil
    reason "MyText"
    year Date.today.year
  end

end
