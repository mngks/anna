class RemovePickupTimeFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :pickup_time
  end
end
