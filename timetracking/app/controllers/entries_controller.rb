class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:id]) || render_404(params) 
  end
end
