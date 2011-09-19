class AddPosToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :latitude, :float
    add_column :prices, :longitude, :float
  end
end
