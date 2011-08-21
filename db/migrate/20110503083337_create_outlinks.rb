class CreateOutlinks < ActiveRecord::Migration
  def self.up
    create_table :outlinks do |t|
      t.string :url
      t.boolean :verified
      t.references :target

      t.timestamps
    end
  end

  def self.down
    drop_table :outlinks
  end
end
