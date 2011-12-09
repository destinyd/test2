class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :desc
      t.string :requirement_desc
      t.string :requirement
      t.string :incentives_desc
      t.string :incentives
      t.integer :type_id
      t.integer :times
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :group_id
      t.string  :prev_task_ids
      t.timestamps
    end
    add_index :tasks,:type_id
    add_index :tasks,:started_at
    add_index :tasks,:finished_at
    add_index :tasks,:group_id
  end
end
