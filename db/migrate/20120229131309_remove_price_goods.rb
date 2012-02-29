class RemovePriceGoods < ActiveRecord::Migration
  def up
    drop_table :price_goods
  end

  def down
    create_table :price_goods do |t|
      t.integer :price_id
      t.integer :good_id
      t.integer :user_id 
      t.timestamps
    end
    add_index :price_goods,:price_id
    add_index :price_goods,:good_id
    add_index :price_goods,:user_id

  end
end
