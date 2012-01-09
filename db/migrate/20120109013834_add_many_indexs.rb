class AddManyIndexs < ActiveRecord::Migration
  def change
    add_index :articles,:is_top
    add_index :attrs,:attrable_id
    add_index :attrs,:attrable_type
    add_index :attrs,:supported
    add_index :goods,:user_id
    add_index :goods,:is_valid
    add_index :integrals,:integralable_id
    add_index :integrals,:integralable_type
    add_index :integrals,:type_id
    add_index :integrals,:user_id
    add_index :msgs,:user_id
    add_index :msgs,:to
    add_index :msgs,:is_read
    add_index :price_goods,:user_id
    add_index :uploads,:uploadable_id
    add_index :uploads,:uploadable_type
    add_index :uploads,:user_id
    add_index :user_tasks,:task_id
  end
end
