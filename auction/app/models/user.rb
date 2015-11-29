class User < ActiveRecord::Base
  validates :first_name, :email, presence: true
  has_secure_password
  has_many :products

  def sort_products
    products.sort do |product1, product2|
      product1.deadline <=> product2.deadline
    end
  end

end
