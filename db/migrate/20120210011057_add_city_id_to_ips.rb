class AddCityIdToIps < ActiveRecord::Migration
  def change
    add_column :ips, :city_id, :integer
  end
end
