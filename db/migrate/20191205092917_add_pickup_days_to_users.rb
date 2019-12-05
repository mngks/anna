class AddPickupDaysToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pickup_days, :string
  end
end
