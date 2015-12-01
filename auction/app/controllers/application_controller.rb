class ApplicationController < ActionController::Base
  require 'pry'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end

  def get_winner_bid(product)
    winner_bid = product.bids.first
    product.bids.each do |bid|
      if bid.amount > winner_bid.amount
        winner_bid = bid
      end
    end
    winner_bid
  end

  def set_winner_bid(product)
    winner_bid = get_winner_bid(product)
    product.winner_bid_id = winner_bid.id
    product.save
  end

  def check_bids_deadline
    Product.all.each do |product|
      if product.deadline < Date.today && product.bids.count > 0
        set_winner_bid(product)
      end
    end
  end

end
