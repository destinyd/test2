class ImportAreas < ActiveRecord::Migration
  def up
    create_table :provinces do |t|
      t.string :name, :limit => 50, :default => "" 
      t.integer :sort#, :limit => 50, :default => "" 
      t.string :remark, :limit => 50, :default => "" 
      t.timestamps
    end

    add_index :provinces,:sort

    create_table :cities do |t|
      t.string :name, :limit => 50, :default => "" 
      t.integer :province_id
      t.integer :sort#, :limit => 50, :default => "" 
      t.timestamps
    end

    add_index :cities,:province_id
    add_index :cities,:sort

    create_table :areas do |t|
      t.string :name, :limit => 50, :default => "" 
      t.integer :city_id
      t.timestamps
    end
    add_index :areas,:city_id

    source = File.new("./db/AllCityData.sql", "r") 
    while (line = source.gets) 
      execute line 
    end 
    source.close 
  end

  def down
    drop_table :areas
    drop_table :cities
    drop_table :provinces
  end
end
