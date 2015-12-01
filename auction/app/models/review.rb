class Review < ActiveRecord::Base
  belongs_to :products
  belongs_to :user
  validates :description, presence: true

  def valid_review_user?(product)
    user_id != product.user_id
  end

end
