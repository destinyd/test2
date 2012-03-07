class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.integer :price_id
      t.integer :locate_id
      t.integer :user_id

      t.timestamps
    end
    add_index :costs, :price_id
    add_index :costs, :locate_id
    add_index :costs, :user_id
  end
end
