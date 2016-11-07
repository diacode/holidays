class CreateGrantedVacationDays < ActiveRecord::Migration
  def change
    create_table :granted_vacation_days do |t|
      t.references :user, index: true, foreign_key: true, nil: false
      t.text :reason

      t.timestamps null: false
    end
  end
end
