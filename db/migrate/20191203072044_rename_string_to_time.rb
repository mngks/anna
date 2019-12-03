class RenameStringToTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :time
    remove_column :donors, :pickup_time
    add_column :donors, :pickup_time, :datetime
  end
end
