class AddBrandIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :brand_id, :integer
    add_index :prices, :brand_id
  end
end
