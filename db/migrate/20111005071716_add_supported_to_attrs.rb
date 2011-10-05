class AddSupportedToAttrs < ActiveRecord::Migration
  def change
    add_column :attrs, :supported, :boolean
  end
end
