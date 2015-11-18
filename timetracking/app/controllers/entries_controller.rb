class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)
    date = Date.current
    @entries = @project.entries.where(date: date.beginning_of_month..date.end_of_month)
    @hours = @project.total_hours_in_month(date.month, date.year)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

end
