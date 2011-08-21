class CreateComplaints < ActiveRecord::Migration
  def self.up
    create_table :complaints do |t|
      t.integer :type_id
      t.string :desc
      t.references :user
      t.references :target

      t.timestamps
    end
  end

  def self.down
    drop_table :complaints
  end
end
