# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean          default(FALSE)
#  first_name             :string
#  last_name              :string
#  avatar                 :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class UserSerializer < ActiveModel::Serializer
  attributes  :id,
              :email,
              :admin,
              :full_name,
              :on_holidays,
              :available_days,
              :current_year_days_spent,
              :avatar_url

  def on_holidays
    object.on_holidays?
  end

  def avatar_url
    {
      original: object.avatar_url,
      thumb: object.avatar_url(:thumb),
      small: object.avatar_url(:small),
      tiny: object.avatar_url(:tiny)
    }
  end
end
