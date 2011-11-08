class AddDescToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :desc, :text
  end
end
