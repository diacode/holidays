class RemoveStatusFromVacationRequests < ActiveRecord::Migration
  def change
    remove_column :vacation_requests, :status
  end
end
