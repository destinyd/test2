class RenameSomeColumns < ActiveRecord::Migration
  def self.up
    rename_column :complaints,:target_id, :complaintable_id
    add_column :complaints, :complaintable_type, :string
    rename_column :msgs, :from,:user_id
    rename_column :outlinks,:target_id, :outlinkable_id
    add_column :outlinks, :outlinkable_type, :string
    rename_column :records,:target_id, :recordable_id
    add_column :records, :recordable_type, :string    
  end

  def self.down
    remove_column :records, :recordable_type
    rename_column :records,:recordable_id, :target_id
    remove_column :outlinks, :outlinkable_type
    rename_column :outlinks,:outlinkable_id, :target_id 
    rename_column :msgs, :user_id,:from
    remove_column :complaints, :complaintable_type                    
    rename_column :complaints,:complaintable_id, :target_id

  end
end
