class CreateShopGoods < ActiveRecord::Migration
  def change
    create_table :shop_goods do |t|
      t.integer :shop_id
      t.integer :good_id
      t.boolean :is_down

      t.timestamps
    end
    add_index :shop_goods, :shop_id
    add_index :shop_goods, :good_id
    add_index :shop_goods, :is_down
  end
end
