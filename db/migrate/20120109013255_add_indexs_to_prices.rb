class AddIndexsToPrices < ActiveRecord::Migration
  def change
    add_index :prices,:type_id
    add_index :prices,:user_id
    add_index :prices,:finish_at
    add_index :prices,:good_id
    add_index :prices,:address
    add_index :prices,:latitude
    add_index :prices,:longitude
    add_index :prices,:title
    add_index :prices,:started_at
  end
end
