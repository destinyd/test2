class ChangeColumnsForGoods < ActiveRecord::Migration
  def change
    add_index :goods,:name,:unique => true
    change_column :goods,:desc,:text
  end
end
