class AddIsValidToMany < ActiveRecord::Migration
  def self.up
    add_column :articles, :is_valid, :boolean
    add_column :goods, :is_valid, :boolean
    add_column :prices, :is_valid, :boolean
  end

  def self.down
    remove_column :prices, :is_valid
    remove_column :goods, :is_valid
    remove_column :articles, :is_valid
  end
end
