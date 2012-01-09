class AddIndexsToOutlinks < ActiveRecord::Migration
  def change
    add_index :outlinks,:outlinkable_id
    add_index :outlinks,:outlinkable_type
  end
end
