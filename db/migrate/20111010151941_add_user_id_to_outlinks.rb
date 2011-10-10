class AddUserIdToOutlinks < ActiveRecord::Migration
  def change
    add_column :outlinks, :user_id, :integer
    add_index :outlinks,:user_id
  end
end
