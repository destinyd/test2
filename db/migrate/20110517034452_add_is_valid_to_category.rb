class AddIsValidToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :is_valid, :boolean  
  end

  def self.down
    remove_column :categories, :is_valid  
  end
end
