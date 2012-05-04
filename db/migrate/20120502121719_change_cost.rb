class ChangeCost < ActiveRecord::Migration
  def change
    rename_column :costs, :cost, :money
    add_column :costs, :cost_id, :integer
    add_index :costs, :cost_id
    add_column :costs, :shop_id, :integer
    add_index :costs, :shop_id
    add_column :costs, :desc, :text
  end
end
