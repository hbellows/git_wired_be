class Api::V1::Repositories::WireframesController < ApplicationController

  def index
    render json: WireframesSerializer.new(wireframes).serialized_json
  end

  private

  def repository
    @repository ||= current_user.repositories.find_by(id: params[:repository_id])
  end
  
  def wireframes
    @wireframes ||= WireframeFinder.new(current_user, repository)
  end
end