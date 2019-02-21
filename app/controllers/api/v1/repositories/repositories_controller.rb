class Api::V1::Repositories::RepositoriesController < ApplicationController

  def index
    render json: RepositorySerializer.new(repositories).serialized_json
  end

  private

  def repositories
    @repositories ||= RepositoryFinder.new(current_user)
  end
  
end
