class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to root_path, notice: "Project added! Huzzah"
    else
      render :new
    end

  end

  def show
    @project =Project.find_by id: params[:id]
  end

  def index
    @projects =Project.all
  end

  def update
    @project =Project.find_by id: params[:id]
    if @project.save
      redirect_to root_path, notice: "Project updated!"
    else
      render :edit
    end
  end



  private
  def project_params
    params.require(:project).permit(:title, :front_end, :back_end, :description, :photo_url, :link)
  end
end
