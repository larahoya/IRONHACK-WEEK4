class BidsController < ApplicationController

  def create
    email = params[:bid][:email]
    amount = params[:bid][:amount]
    @user = User.find_by(email: email)
    @product = Product.find(params[:product_id])
    @bid = Bid.new(product_id: @product.id, user_id: @user.id, amount: amount)
    if @bid.valid_bid_amount?(@product) && @bid.valid_bid_user?(@product) && @bid.save
      flash[:notice] = "Bid saved succesfully!"
    else
      flash[:alert] = "Error"
      flash[:alert] = "Not valid amount!" if @bid.valid_bid_amount?(@product) != true
      flash[:alert] = "Not valid user!" if @bid.valid_bid_user?(@product) != true
    end
    redirect_to(user_product_path(@user, @product))
  end

end