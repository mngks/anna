class AddCompletedToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :completed?, :boolean, default: false
  end
end
