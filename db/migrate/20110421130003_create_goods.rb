class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.string :name
      t.string :desc
      t.references :user
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
