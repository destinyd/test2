class AddUserIdToMany < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
    add_index :products, :user_id
    add_column :norms, :user_id, :integer
    add_index :norms, :user_id
    add_column :units, :user_id, :integer
    add_index :units, :user_id
  end
end
