class AddStatusToVacationRequests < ActiveRecord::Migration
  def change
    add_column :vacation_requests, :status, :integer, index: true, default: 0
  end
end
