class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  def active_bid?
    deadline <= Date.today ? false : true
  end

  def get_maximum_bid
    max_bid = bids[0] 
    bids.each do |bid|
      if bid.amount > max_bid.amount
        max_bid = bid
      end
    end
    max_bid
  end

  def get_maximum_bid_amount
    if bids.length == 0
      return 0
    else
      return get_maximum_bid.amount
    end
  end

end
