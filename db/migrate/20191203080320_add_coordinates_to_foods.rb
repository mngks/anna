class AddCoordinatesToFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :latitude
    remove_column :foods, :longtitude
    add_column :foods, :latitude, :float
    add_column :foods, :longitude, :float
  end
end
