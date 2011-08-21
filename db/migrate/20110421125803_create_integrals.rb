class CreateIntegrals < ActiveRecord::Migration
  def self.up
    create_table :integrals do |t|
      t.integer :point
      t.string :desc
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :integrals
  end
end
