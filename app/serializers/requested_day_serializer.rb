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

class RequestedDaySerializer < ActiveModel::Serializer
  attributes  :id,
              :status,
              :day,
              :user_avatar

  def user_avatar
    gravatar_id = Digest::MD5::hexdigest(object.vacation_request.user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=80"
  end
end
