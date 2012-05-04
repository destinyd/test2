class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :desc
      t.integer :user_id
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_index :companies, :user_id
  end
end
