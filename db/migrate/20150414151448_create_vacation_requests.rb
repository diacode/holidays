class CreateVacationRequests < ActiveRecord::Migration
  def change
    create_table :vacation_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
