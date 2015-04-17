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
  has_many :requested_days, dependent: :destroy
  accepts_nested_attributes_for :requested_days, allow_destroy: true, reject_if: :all_blank
end
