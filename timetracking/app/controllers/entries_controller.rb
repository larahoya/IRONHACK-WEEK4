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

  def create
    @project =Project.find(params[:project_id])
    @entry = @project.entries.new entry_params
    @entry.save
    if @entry.save
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      @errors = @entry.errors.full_messages
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
    if @entry.update_attributes(entry_params)
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      @errors = @entry.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
    @entry.destroy
    redirect_to action: 'index', controller: 'entries', project_id: @project.id
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
