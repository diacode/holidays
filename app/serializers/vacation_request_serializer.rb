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

class VacationRequestSerializer < ActiveModel::Serializer
  attributes  :id,
              :message,
              :user_name,
              :user_avatar,
              :created_at,
              :editable

  has_many :requested_days

  def user_name
    object.user.first_name
  end

  def user_avatar
    gravatar_id = Digest::MD5::hexdigest(object.user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=80"
  end

  def editable
    object.editable?
  end
end
