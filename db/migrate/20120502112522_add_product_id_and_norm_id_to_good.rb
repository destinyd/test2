class AddProductIdAndNormIdToGood < ActiveRecord::Migration
  def change
    add_column :goods, :product_id, :integer
    add_index :goods, :product_id
    add_column :goods, :norm_id, :integer
    add_index :goods, :norm_id
    add_column :goods, :brand_id, :integer
    add_index :goods, :brand_id
  end
end
