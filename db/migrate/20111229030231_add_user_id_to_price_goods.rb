class AddUserIdToPriceGoods < ActiveRecord::Migration
  def change
    add_column :price_goods, :user_id, :integer
  end
end
