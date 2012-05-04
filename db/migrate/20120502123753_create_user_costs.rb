class CreateUserCosts < ActiveRecord::Migration
  def change
    create_table :user_costs do |t|
      t.integer :user_id
      t.integer :cost_id

      t.timestamps
    end
    add_index :user_costs, :user_id
    add_index :user_costs, :cost_id
  end
end
