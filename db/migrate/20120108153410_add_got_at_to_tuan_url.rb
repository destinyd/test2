class AddGotAtToTuanUrl < ActiveRecord::Migration
  def change
    add_column :tuan_urls, :got_at, :datetime
  end
end
