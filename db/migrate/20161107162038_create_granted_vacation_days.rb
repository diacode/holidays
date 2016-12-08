class CreateGrantedVacationDays < ActiveRecord::Migration
  def change
    create_table :granted_vacation_days do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.text :reason
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
