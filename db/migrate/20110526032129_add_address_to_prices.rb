class AddAddressToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :address, :string
  end

  def self.down
    remove_column :prices, :address
  end
end
