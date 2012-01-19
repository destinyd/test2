class AddGeoToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :lat, :float
    add_column :areas, :lon, :float
    add_column :cities, :lat, :float
    add_column :cities, :lon, :float
    add_column :provinces, :lat, :float
    add_column :provinces, :lon, :float
  end
end
