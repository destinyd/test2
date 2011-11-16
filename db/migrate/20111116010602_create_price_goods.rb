class CreatePriceGoods < ActiveRecord::Migration
  def change
    create_table :price_goods do |t|
      t.integer :price_id
      t.integer :good_id
      t.timestamps
    end
    add_index :price_goods,:price_id
    add_index :price_goods,:good_id
  end
end
