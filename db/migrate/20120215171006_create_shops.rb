class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :desc
      t.string :address
      t.float :lat
      t.float :lon
      t.integer :user_id
      t.boolean :is_valid

      t.timestamps
    end
    add_index :shops, :lat
    add_index :shops, :lon
    add_index :shops, :user_id
    add_index :shops, :is_valid
  end
end
