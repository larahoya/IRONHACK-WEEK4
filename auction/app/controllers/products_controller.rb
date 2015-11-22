class ProductsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @product = Product.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = Product.new entry_params
    if @product.save
      flash[:notice] = 'Product created successfully'
      render 'show'
    else
      flash[:alert] = "Product couldn't be created"
      @errors = @entry.errors.full_messages
      render 'new'
    end
  end

  def list
    @products = Product.all
  end

  def index
    @user = User.find(params[:user_id])
    @user_products = @user.products
  end

  def show
    @user = User.find(params[:user_id])
    @product = Product.find(params[:id])
  end

  private

  def entry_params
    params.require(:product).permit(:title, :description, :deadline)
  end

end
