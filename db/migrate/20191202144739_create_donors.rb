class CreateDonors < ActiveRecord::Migration[5.2]
  def change
    create_table :donors do |t|
      t.string :full_name
      t.string :username
      t.string :bio
      t.string :pickup_time
      t.string :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
