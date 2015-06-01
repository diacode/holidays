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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable

  # Relations
  has_many :vacation_requests, dependent: :destroy
  has_many :requested_days, through: :vacation_requests

  # Scopes
  default_scope { order('first_name ASC') }
  scope :admin, -> {where admin: true}

  # Validations
  validates :first_name, :last_name, presence: true

  class << self
    def admin_emails
      admin.pluck(:email)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def available_days
    all_time_vacations = AVAILABLE_VACATIONS.map { |k,v| v }.sum
    all_time_vacations-requested_days.approved.count
  end

  def current_year_days_spent
    requested_days.approved.current_year.count
  end

  def on_holidays?
    requested_days.approved.where(day: Date.today).any?
  end
end
