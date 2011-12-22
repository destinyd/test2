class ChangeColumnIntegralsTypeId < ActiveRecord::Migration
  def up
    change_column :integrals,:type_id,:integer,:limit => 2
  end

  def down
    change_column :integrals,:type_id,:boolean
  end
end
