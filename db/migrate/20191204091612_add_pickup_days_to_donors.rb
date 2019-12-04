class AddPickupDaysToDonors < ActiveRecord::Migration[5.2]
  def change
    add_column :donors, :pickup_days, :string
  end
  end
end
