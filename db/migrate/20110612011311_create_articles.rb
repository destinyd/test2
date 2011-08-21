class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :category
      t.boolean :is_top

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
