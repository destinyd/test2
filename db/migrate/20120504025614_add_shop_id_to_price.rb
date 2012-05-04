class AddShopIdToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :shop_id, :integer
    add_index :prices, :shop_id
  end
end
