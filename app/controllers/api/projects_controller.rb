class Api::ProjectsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action do
    request.format = :json
  end

    def new
      @project = Project.new
    end

    def create
      @project = Project.create(project_params)
      if @project.save
        redirect_to root_path, notice: "Project Created"
      else
        render :new
      end
    end

    def update
    end

    def index
      @projects =Project.all
    end

    def show
      @project =Project.find_by id: params[:id]
    end

    private

    def project_params
      params.require(:project).permit(:users, :kind, :description, :year, :status, :user_ids => [] )
    end
  end
