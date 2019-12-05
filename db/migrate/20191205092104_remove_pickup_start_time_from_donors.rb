class RemovePickupStartTimeFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :pickup_start_time
  end
end
