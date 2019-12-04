class RemoveUsernameFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :username
  end
end
