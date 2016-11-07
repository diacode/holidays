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

class PublicHolidaySerializer < ActiveModel::Serializer
  attributes :id, :name, :day
end
