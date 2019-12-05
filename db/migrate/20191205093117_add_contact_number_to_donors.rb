class AddContactNumberToDonors < ActiveRecord::Migration[5.2]
  def change
    add_column :donors, :contact_number, :string
  end
end
