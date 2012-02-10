class AddCityIdToIps < ActiveRecord::Migration
  def change
    add_column :ips, :city_id, :integer
    add_index :ips, :city_id
  end
end
