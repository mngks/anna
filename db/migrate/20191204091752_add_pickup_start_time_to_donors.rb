class AddPickupStartTimeToDonors < ActiveRecord::Migration[5.2]
  def change
    add_column :donors, :pickup_start_time, :time
  end
end
