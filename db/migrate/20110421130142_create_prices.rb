class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.float :price
      t.integer :type_id
      t.integer :region_id
      t.integer :amount
      t.references :user
      t.datetime :finish_at

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
