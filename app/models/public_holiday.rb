# == Schema Information
#
# Table name: public_holidays
#
#  id         :integer          not null, primary key
#  name       :string
#  day        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_public_holidays_on_day  (day)
#

class PublicHoliday < ActiveRecord::Base
  # Scopes
  scope :sorted, -> { order day: :asc }
  scope :by_month, -> (date) { sorted.where day: date.beginning_of_month..date.end_of_month}
  scope :by_year, -> (date) { sorted.where day: date.beginning_of_year..date.end_of_year }

  # Validations
  validates :day, uniqueness: true
end
