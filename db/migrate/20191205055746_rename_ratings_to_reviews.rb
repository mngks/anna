class RenameRatingsToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_table :ratings, :reviews
  end
end
