class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist.")
    render "layouts/404"
  end
  
end
