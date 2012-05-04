class AddBrandIdToShop < ActiveRecord::Migration
  def change
    add_column :shops, :brand_id, :integer
    add_index :shops, :brand_id
  end
end
