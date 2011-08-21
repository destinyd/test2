class AddGoodIdToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :good_id, :integer
  end

  def self.down
    remove_column :prices, :good_id
  end
end
