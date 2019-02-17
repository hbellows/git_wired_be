class Api::V1::Repositories::ProjectsController < ApplicationController

  def index
    render json: ProjectSerializer.new(projects).serialized_json
  end
  
  def show
    render json: ProjectSerializer.new(project).serialized_json
  end

  private

  def projects
    
  end

  def project
    @projects ||= ProjectFinder.new(params[:github_login])
  end
end