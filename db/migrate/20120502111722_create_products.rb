class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.integer :brand_id

      t.timestamps
    end
    add_index :products, :brand_id
  end
end
