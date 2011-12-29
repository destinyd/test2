class AddIsGoldToIntegrals < ActiveRecord::Migration
  def change
    add_column :integrals, :is_gold, :boolean
  end
end
