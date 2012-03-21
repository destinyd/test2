class PricesPicToGood < ActiveRecord::Migration
  def up
    source = File.new("./db/prices_pic_to_goods.sql", "r") 
    while (line = source.gets) 
      execute line 
    end 
    source.close 
  end

  def down
  end
end
