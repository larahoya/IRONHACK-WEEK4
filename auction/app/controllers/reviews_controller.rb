class ReviewsController < ApplicationController

  def create
    description = params[:review][:description]
    @product_user = User.find(params[:user_id])
    user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new(product_id: @product.id, user_id: user.id, description: description)
    if @review.save && @review.valid_review_user?(@product)
      flash[:notice] = "Review saved succesfully!"
    else
      flash[:alert] = "Error"
    end
    redirect_to(user_product_path(@product_user, @product))
  end

  def destroy
    @review = Review.find(params[:id])
    @user = User.find(params[:user_id])
    if @review.destroy
      flash[:notice] = "Review deleted succesfully!"
    else
      flash[:alert] = "Error"
    end
    redirect_to(user_path(@user))
  end

  def update
    new_description = params[:description]
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @review.description = new_description
    if @review.save
      flash[:notice] = "Review updated succesfully!"
    else
      flash[:alert] = "Error"
    end
    redirect_to(user_path(@user))
  end

end
