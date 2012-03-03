class CreateBrandGoods < ActiveRecord::Migration
  def change
    create_table :brand_goods do |t|
      t.integer :brand_id
      t.integer :good_id
      t.datetime :down_at

      t.timestamps
    end
    add_index :brand_goods, :brand_id
    add_index :brand_goods, :good_id
    add_index :brand_goods, :down_at
  end
end
