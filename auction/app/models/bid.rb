class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :amount, presence: true
  validates :amount, numericality: true

  def valid_bid_amount?(product)
    amount >= product.minimum_bid && amount >= product.get_maximum_bid_amount
  end

  def valid_bid_user?(product)
    user_id != product.user_id
  end

end
