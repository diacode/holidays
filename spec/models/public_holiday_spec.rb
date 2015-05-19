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

require 'rails_helper'

RSpec.describe PublicHoliday, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
