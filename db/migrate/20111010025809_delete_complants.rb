class DeleteComplants < ActiveRecord::Migration
  def change
    drop_table :complaints
  end
end
