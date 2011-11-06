class RemoveSomeColumns < ActiveRecord::Migration
  def change
    remove_column :prices, :region_id
    remove_column :goods, :category_id
    remove_column :articles, :category_id
    remove_column :flashes, :category_id
  end
end
