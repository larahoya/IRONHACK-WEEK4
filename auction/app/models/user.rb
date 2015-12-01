class User < ActiveRecord::Base
  validates :first_name, :email, presence: true
  has_secure_password
  has_many :products
  has_many :reviews
  has_many :bids
  has_many :ratings

  def sort_products
    sorted = self.products.sort do |product1, product2|
      product1.deadline <=> product2.deadline
    end
  end

  def get_shopping_cart
    my_cart = []
    Product.all.each do |product|
      if product.winner_bid_id
        winner_bid = Bid.find(product.winner_bid_id)
        if winner_bid.user_id == id
          my_cart.push(product)
        end
      end
    end
    my_cart
  end

  def get_average_rate
    sum_rate = ratings.reduce(0) do |sum, rating|
      sum += rating.rate
    end
    sum_rate / ratings.length
  end

end
