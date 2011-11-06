class CreateTuanApis < ActiveRecord::Migration
  def change
    create_table :tuan_apis do |t|
      t.string :name
      t.string :url
      t.string :docfind
      t.string :suite
      t.boolean :enable

      t.timestamps
    end
  end
end
