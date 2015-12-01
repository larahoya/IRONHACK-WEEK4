class AddWinnerBidIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :winner_bid_id, :integer
  end
end
