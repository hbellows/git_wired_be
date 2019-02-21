class Api::V1::Repositories::ProjectsController < ApplicationController

  def index
    render json: ProjectsSerializer.new(projects).serialized_json
  end

  def show
    render json: ColumnsSerializer.new(columns).serialized_json
  end
  
  private

  def repository
    @find_repository ||= current_user.repositories.find_by(id: params[:repository_id])
  end
  
  def projects
    @projects ||= ProjectFinder.new(current_user, repository)
  end

  def project
    @project ||= repository.projects.find_by(id: params[:id])
  end

  def columns
    @columns ||= ColumnFinder.new(current_user, project)
  end
end