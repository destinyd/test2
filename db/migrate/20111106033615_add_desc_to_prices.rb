class AddDescToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :desc, :string
  end
end
