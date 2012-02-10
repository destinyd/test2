class ManyChangeForGoodsAndPrices < ActiveRecord::Migration
  def up
    #if GC.respond_to?(:copy_on_write_friendly=)
      #GC.copy_on_write_friendly = true
    #end

    #jobs_per_process = 100
    #process_count = 5
    #Price.select('`prices`.id , `prices`.`title` , `prices`.`desc` , user_id').find_in_batches(:batch_size => jobs_per_process * process_count) do |group|
      #batches = group.in_groups(process_count)
      #batches.each do |batch|
        #Process.fork do
          #ActiveRecord::Base.establish_connection
          ## Do the actual work
          #batch.each do |price|
            #good = Good.where(:name => price.title).first_or_create
            #unless good.desc and price.desc
              #good.desc = price.desc
              #good.user_id = price.user_id unless good.user_id
              #good.prices << price unless good.prices.include? price
              #good.save if good.changed?
            #end

          #end
        #end
      #end
      #Process.waitall
    #end

    source = File.new("./db/prices_to_goods.sql", "r") 
    while (line = source.gets) 
      execute line 
    end 
    source.close 
  end

  def down
    #if GC.respond_to?(:copy_on_write_friendly=)
      #GC.copy_on_write_friendly = true
    #end

    #jobs_per_process = 100
    #process_count = 5
    #Price.select('`prices`.`id`,`prices`.`title`,`prices`.`desc`').find_in_batches(:batch_size => jobs_per_process * process_count) do |group|
      #batches = group.in_groups(process_count)
      #batches.each do |batch|
        #Process.fork do
          #ActiveRecord::Base.establish_connection
          ## Do the actual work
          #batch.each do |price| 
            #if price.title.nil? and good = price.goods.first
              #price.title = good.name
              #price.desc = good.desc
            #end
          #end
        #end
      #end
    #end
  end
end
