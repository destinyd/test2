class AddIndexToCities < ActiveRecord::Migration
  def change
    add_index :cities,:name
    add_index :cities,:lon
    add_index :cities,:lat
  end
end
