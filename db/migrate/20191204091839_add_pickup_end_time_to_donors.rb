class AddPickupEndTimeToDonors < ActiveRecord::Migration[5.2]
 def change
    add_column :donors, :pickup_end_time, :time
  end
end
