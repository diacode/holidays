class CreatePublicHolidays < ActiveRecord::Migration
  def change
    create_table :public_holidays do |t|
      t.string :name
      t.date :day, index: true

      t.timestamps null: false
    end
  end
end
