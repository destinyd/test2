class CreateFlashes < ActiveRecord::Migration
  def self.up
    create_table :flashes do |t|
      t.belongs_to :category

      t.timestamps
    end
  end

  def self.down
    drop_table :flashes
  end
end
