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
    gravatar_id = Digest::MD5::hexdigest(object.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=100"
  end
end
