class AddReferencesToMessages < ActiveRecord::Migration[5.2]
  def change
     add_reference :messages, :receiving_user, foreign_key: { to_table: 'users' }
  end
end
