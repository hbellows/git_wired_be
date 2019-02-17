class Api::V1::Repositories::ProjectsController < ApplicationController

  def index
    render json: ProjectSerializer.new(repository.projects).serialized_json
  end
  

  private

  def repository
    @repository ||= Repository.find_by(id: params[:repository_id])
  end

  # USE THIS METHOD ONCE AUTHENTICATION IS FINALIZED
  # def repository
  #   @repository ||= current_user.repositories.find_by(id: params[:repository_id)
  # end

end