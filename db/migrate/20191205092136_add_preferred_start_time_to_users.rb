class AddPreferredStartTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :preferred_start_time, :time
  end
end
