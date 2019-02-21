class Api::V1::Repositories::WireframesController < ApplicationController

  def index
    render json: WireframesSerializer.new(wireframes).serialized_json
  end

  def show
    render json: WireframeSerializer.new(wireframe).serialized_json
  end

  private

  def repository
    @repository ||= current_user.repositories.find_by(id: params[:repository_id])
  end

  def wireframes
    @wireframes ||= WireframeFinder.new(current_user, repository)
  end

  def wireframe
    @wireframe ||= WireframeFinder.new(current_user, repository, params[:id])
  end
end
