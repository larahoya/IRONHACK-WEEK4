class PeopleController < ApplicationController

  def new
    @person = Person.new
    @projects = Project.all
  end

  def create
    @person = Person.new entry_params
    if @person.save
      redirect_to action: 'show', controller: 'people', id: @person.id
    else
      render 'new'
    end
  end

  def show
    @person = Person.find_by(id: params[:id])
    @projects = @person.projects
    @no_associated_projects = @person.select_no_associated_projects
    if @person
      @person
    else
      render_404(params)
    end
  end

  def update
    @person = Person.find(params[:id])
    @project = Project.find(params[:person][:projects])
    @person.projects << @project
    redirect_to action: 'show', controller: 'people', project_id: @project.id
  end

  private

  def entry_params
    params.require(:person).permit(:name)
  end

end
