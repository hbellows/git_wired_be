class Api::V1::Repositories::ProjectsController < ApplicationController

  def show
    render json: ProjectSerializer.new(projects).serialized_json
  end

  private

  def projects
    @projects ||= ProjectFinder.new(params[:github_login])
  end
end