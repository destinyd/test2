class CreateLocates < ActiveRecord::Migration
  def change
    create_table :locates do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps
    end
    add_index :locates,:name
    add_index :locates,:lat
    add_index :locates,:lon
  end
end
