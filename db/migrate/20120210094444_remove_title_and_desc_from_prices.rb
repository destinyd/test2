class RemoveTitleAndDescFromPrices < ActiveRecord::Migration
  def up
    remove_column :prices,:title
    remove_column :prices,:desc
  end

  def down
    add_column :prices,:title,:string
    add_column :prices,:desc,:text
  end
end
