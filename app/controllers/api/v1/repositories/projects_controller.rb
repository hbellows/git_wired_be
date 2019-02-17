class Api::V1::Repositories::ProjectsController < ApplicationController

  def index
    render json: ProjectSerializer.new(repository.projects).serialized_json
  end
  
  private

  def repository
    @repository ||= Repository.find_by(id: params[:repository_id])
  end

  def project
    @project ||= ProjectFinder.new(params[:user_name], repository.id)
  end
  
  # TODO: UPDATE THE ABOVE METHODS ONCE AUTHENTICATION IS FINALIZED

  # def repository
  #   @repository ||= current_user.repositories.find_by(id: params[:repository_id)
  # end
  
  # def project
  #   @project ||= ProjectFinder.new(current_user.user_name, repository)
  # end

end