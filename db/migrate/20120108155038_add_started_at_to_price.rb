class AddStartedAtToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :started_at, :datetime
  end
end
