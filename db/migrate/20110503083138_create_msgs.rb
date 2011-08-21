class CreateMsgs < ActiveRecord::Migration
  def self.up
    create_table :msgs do |t|
      t.string :title
      t.string :body
      t.integer :from
      t.integer :to
      t.boolean :is_read

      t.timestamps
    end
  end

  def self.down
    drop_table :msgs
  end
end
