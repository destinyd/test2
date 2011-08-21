class AddUrlToFlashes < ActiveRecord::Migration
  def self.up
    add_column :flashes, :url, :string
  end

  def self.down
    remove_column :flashes, :url
  end
end
