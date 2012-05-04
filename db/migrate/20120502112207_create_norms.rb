class CreateNorms < ActiveRecord::Migration
  def change
    create_table :norms do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
    add_index :norms, :brand_id
  end
end
