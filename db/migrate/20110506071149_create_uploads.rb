class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.integer :uploadable_id
      t.string :uploadable_type
      t.datetime :deleted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
