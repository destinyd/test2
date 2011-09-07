class AddSomeToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :desc, :string
    add_column :reviews, :user_id, :integer
    add_index  :reviews, :user_id
  end
end
