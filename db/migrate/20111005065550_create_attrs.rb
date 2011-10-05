class CreateAttrs < ActiveRecord::Migration
  def change
    create_table :attrs do |t|
      t.string :name
      t.string :value
      t.integer :attrable_id
      t.string :attrable_type

      t.timestamps
    end
  end
end
