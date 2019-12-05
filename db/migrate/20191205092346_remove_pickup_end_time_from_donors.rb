class RemovePickupEndTimeFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :pickup_end_time
  end
end
