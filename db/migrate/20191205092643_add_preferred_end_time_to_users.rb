class AddPreferredEndTimeToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :preferred_end_time, :time
  end
end
