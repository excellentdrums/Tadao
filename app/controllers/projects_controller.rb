class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all  
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    
    if @project.save
      flash[:notice] = "Your project has been created."
      redirect_to projects_path
    else
      render :new
    end
  end
end