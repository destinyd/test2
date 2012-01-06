class ChangeTuanApisSuite < ActiveRecord::Migration
  def up
    change_column :tuan_apis,:suite,:text
  end

  def down
    change_column :tuan_apis,:suite,:string
  end
end
