class CreateRequestedDays < ActiveRecord::Migration
  def change
    create_table :requested_days do |t|
      t.date :day, null: false
      t.integer :status, default: 0
      t.references :vacation_request, index: true, foreign_key: true, null: false
      t.integer :validator_id
      t.datetime :validated_at

      t.timestamps null: false
    end

    add_index :requested_days, :validator_id
    add_foreign_key :requested_days, :users, column: :validator_id
  end
end
