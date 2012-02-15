class CreatePackageGoods < ActiveRecord::Migration
  def change
    create_table :package_goods do |t|
      t.integer :good_id
      t.integer :package_id

      t.timestamps
    end
    add_index :package_goods, :good_id
    add_index :package_goods, :package_id
  end
end
