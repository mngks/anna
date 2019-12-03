class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.date :purchase_date
      t.references :donor, foreign_key: true
      t.string :location
      t.string :latitude
      t.string :longtitude
      t.string :photo

      t.timestamps
    end
  end
end
