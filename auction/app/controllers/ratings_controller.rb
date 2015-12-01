class RatingsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    rate = params[:rate].to_i
    @rate = user.ratings.new(user_id: user.id, rate: rate)
    if @rate.save
      flash[:notice] = "Rate saved succesfully!"
    else
      flash[:alert] = "Error"
    end
    redirect_to(user_path(current_user))
  end

end
