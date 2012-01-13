class ChangeTypeIds < ActiveRecord::Migration
  def up
    Price.where(:type_id => 1).each{|price| price.update_attribute :type_id,6}
    Price.where(:type_id => 11).each{|price| price.update_attribute :type_id,1}
  end

  def down
    Price.where(:type_id => 1).each{|price| price.update_attribute :type_id,11}
    Price.where(:type_id => 6).each{|price| price.update_attribute :type_id,1}
  end
end
