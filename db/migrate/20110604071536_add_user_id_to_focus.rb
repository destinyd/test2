class AddUserIdToFocus < ActiveRecord::Migration
  def self.up
    add_column :focus, :user_id, :integer
    add_index :focus, :user_id
  end

  def self.down
    remove_column :focus, :user_id
  end
end
