class ChangePosToDouble < ActiveRecord::Migration
  def up
    change_column :areas,:lat,:double
    change_column :areas,:lon,:double
    change_column :cities,:lat,:double
    change_column :cities,:lon,:double
    change_column :provinces,:lat,:double
    change_column :provinces,:lon,:double
    change_column :ips,:lat,:double
    change_column :ips,:lon,:double
    change_column :locates,:lat,:double
    change_column :locates,:lon,:double
    change_column :shops,:lat,:double
    change_column :shops,:lon,:double
    change_column :prices,:latitude,:double
    change_column :prices,:longitude,:double
  end

  def down
    change_column :prices,:latitude,:float
    change_column :prices,:longitude,:float
    change_column :areas,:lat,:float
    change_column :areas,:lon,:float
    change_column :cities,:lat,:float
    change_column :cities,:lon,:float
    change_column :provinces,:lat,:float
    change_column :provinces,:lon,:float
    change_column :ips,:lat,:float
    change_column :ips,:lon,:float
    change_column :locates,:lat,:float
    change_column :locates,:lon,:float
    change_column :shops,:lat,:float
    change_column :shops,:lon,:float
  end
end
