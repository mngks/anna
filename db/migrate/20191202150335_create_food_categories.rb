class CreateFoodCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :food_categories do |t|
      t.references :food, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
