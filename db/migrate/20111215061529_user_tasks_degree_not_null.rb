class UserTasksDegreeNotNull < ActiveRecord::Migration
  def up
    change_column_null :user_tasks,:degree,false, 0 
  end

  def down
    change_column_null :user_tasks,:degree,true
  end
end
