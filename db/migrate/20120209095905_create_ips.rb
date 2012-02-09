class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ip,:limit => 15
      t.float :lat
      t.float :lon

      t.timestamps
    end
    add_index :ips, :ip
  end
end
