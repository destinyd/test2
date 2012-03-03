class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :desc
      t.integer :user_id
      t.boolean :is_valid
      t.integer :company_id

      t.timestamps
    end
    add_index :brands, :user_id
    add_index :brands, :is_valid
    add_index :brands, :company_id
  end
end
