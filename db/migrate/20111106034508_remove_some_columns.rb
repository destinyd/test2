class RemoveSomeColumns < ActiveRecord::Migration
  def up 
    remove_column :prices, :region_id
    remove_column :goods, :category_id
    remove_column :articles, :category_id
    remove_column :flashes, :category_id
  end
  def down
    add_column :prices, :region_id,:integer
    add_column :goods, :category_id,:integer
    add_column :articles, :category_id,:integer
    add_column :flashes, :category_id,:integer
  end
end
