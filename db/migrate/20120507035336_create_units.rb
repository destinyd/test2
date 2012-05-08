class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
    add_index :units, :brand_id
  end
end
