class CreateFocus < ActiveRecord::Migration
  def self.up
    create_table :focus do |t|
      t.integer :focusable_id
      t.string :focusable_type
      t.timestamps
    end
    add_index :focus,:focusable_id
    add_index :focus,:focusable_type
  end

  def self.down
    drop_table :focus
  end
end
