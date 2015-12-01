class ProductsController < ApplicationController
  before_action :check_bids_deadline, only: :show

  # def new
  #   @user = User.find(params[:user_id])
  #   @product = Product.new
  # end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new entry_params
    if @product.save
      flash[:notice] = 'Product created successfully'
    else
      flash[:alert] = "Product couldn't be created"
      @errors = @product.errors.full_messages
    end
    redirect_to "/users/#{@user.id}"
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
    params.require(:product).permit(:title, :description, :deadline, :minimum_bid, :user_id)
  end

end