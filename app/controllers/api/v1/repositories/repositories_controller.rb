class Api::V1::Repositories::RepositoriesController < ApplicationController

  def index
    render json: RepositorySerializer.new(repositories).serialized_json
  end

  private

  def user
    @user ||= User.find_by(user_name: params[:user_name])
  end
  
  def repositories
    @repositories ||= RepositoryFinder.new(user)
  end
  
  # TODO: Refactor and test with current user
  # def repositories
  #   @repositories ||= RepositoryFinder.new(user)
  # end

end