class RenameIntegralsIsGoldToTypeId < ActiveRecord::Migration
  def up
    rename_column :integrals,:is_gold,:type_id
  end

  def down
    rename_column :integrals,:type_id,:is_gold
  end
end
