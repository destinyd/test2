class ChangeColumnPricesAmount < ActiveRecord::Migration
  def up
    change_column :prices,:amount,:decimal, :precision => 16, :scale => 3
  end

  def down
    change_column :prices,:amount,:integer
  end
end
