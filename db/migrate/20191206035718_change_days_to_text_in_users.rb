class ChangeDaysToTextInUsers < ActiveRecord::Migration[5.2]
  def change
     change_column :users, :pickup_days, :text
  end
end
