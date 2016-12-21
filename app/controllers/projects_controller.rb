class ProjectsController < ApplicationController


  def new
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
    @project = Project.new
  end

  def create

      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
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


def edit
  if @current_user.nil?
    redirect_to sign_in_path, alert: "Please Sign In"
  end
  @project =Project.find_by id: params[:id]
end

  def update
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end

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
