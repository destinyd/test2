class RemoveColumnsFromTuanApis < ActiveRecord::Migration
  def up
    remove_column :tuan_apis,:url
    remove_column :tuan_apis,:enable
  end

  def down
    add_column :tuan_apis,:url,:string
    add_column :tuan_apis,:enable,:boolean
  end
end
