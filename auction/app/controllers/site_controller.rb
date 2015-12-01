class SiteController < ApplicationController

  def home
    session[:user_id] = nil if(current_user == nil)
  end

end
