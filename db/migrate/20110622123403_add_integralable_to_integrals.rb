class AddIntegralableToIntegrals < ActiveRecord::Migration
  def self.up
    add_column :integrals, :integralable_id, :integer
    add_column :integrals, :integralable_type, :string, :limit => 64
  end

  def self.down
    remove_column :integrals, :integralable_type
    remove_column :integrals, :integralable_id
  end
end
