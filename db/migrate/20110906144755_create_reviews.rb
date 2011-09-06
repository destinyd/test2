class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewable_id
      t.string :reviewable_type
      t.integer :status

      t.timestamps
    end
    add_index :reviews,:reviewable_id
    add_index :reviews,:reviewable_type
    add_index :reviews,:status
  end
end
