class CreateTuanUrls < ActiveRecord::Migration
  def change
    create_table :tuan_urls do |t|
      t.string :name
      t.string :url
      t.boolean :enable
      t.integer :tuan_api_id

      t.timestamps
    end
    remove_column :tuan_apis,:url
    remove_column :tuan_apis,:enable
    add_index :tuan_urls, :tuan_api_id
  end
end
