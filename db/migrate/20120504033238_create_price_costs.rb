class CreatePriceCosts < ActiveRecord::Migration
  def change
    create_table :price_costs do |t|
      t.integer :price_id
      t.integer :cost_id
      t.integer :amount

      t.timestamps
    end
    add_index :price_costs, :price_id
    add_index :price_costs, :cost_id
  end
end
