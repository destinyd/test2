class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.datetime :finished_at
      t.integer :degree
      t.timestamps
    end
    add_index :user_tasks,:user_id
    add_index :user_tasks,:finished_at
    add_index :user_tasks,:degree
  end
end
