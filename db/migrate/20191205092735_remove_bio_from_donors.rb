class RemoveBioFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_column :donors, :bio
  end
end
