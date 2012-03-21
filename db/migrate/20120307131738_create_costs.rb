class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.integer :good_id
      t.integer :price_id
      t.integer :locate_id
      t.integer :user_id
      t.decimal :amount, :precision => 10, :scale => 3
      t.decimal :cost, :precision => 16,:scale => 2
      t.timestamps
    end
    add_index :costs, :good_id
    add_index :costs, :price_id
    add_index :costs, :locate_id
    add_index :costs, :user_id
  end
end
