class Api::V1::Repositories::ProjectsController < ApplicationController

  def index
    render json: ProjectSerializer.new(project).serialized_json
  end
  
  private

  def repository
    @repository ||= current_user.repositories.find_by(id: params[:repository_id])
  end
  
  def project
    @project ||= ProjectFinder.new(current_user, repository)
  end
end