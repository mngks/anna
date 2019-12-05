class RemovePickupDaysFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :pickup_days
  end
end
