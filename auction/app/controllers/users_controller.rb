class UsersController < ApplicationController
  before_action :check_bids_deadline, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @product = Product.new
    @cart = @user.get_shopping_cart
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
