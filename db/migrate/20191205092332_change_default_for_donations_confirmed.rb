class ChangeDefaultForDonationsConfirmed < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:donations, :confirmed, false)
  end
end
