class Api::V1::Repositories::WireframesController < ApplicationController
  before_action :validate_name, only: [:create]
  before_action :validate_object, only: [:create]

  def index
    render json: WireframesSerializer.new(wireframes).serialized_json
  end

  def create
    @wireframe ||= repository.wireframes.find_or_create_by(name: params[:name], object: params[:object])
    render json: { message: "Wireframe successfully created" }, status: 200
  end
    
  def show
    json = WireframeSerializer.new(wireframe).serialized_json
    hash = JSON.parse(json)
    hash["data"]["repo"] = repository.name
    render json: hash 
  end

  private

  def repository
    @repository ||= current_user.repositories.find_by(id: params[:repository_id])
  end

  def wireframes
    @wireframes ||= WireframeFinder.new(current_user, repository)
  end

  def validate_name
    render json: nil, status: 401 if params[:name].nil? 
  end

  def validate_object
    render json: nil, status: 401 if params[:object].nil? 
  end

  def wireframe
    finder = WireframeFinder.new(current_user, repository)
    @wireframe ||= finder.wireframe(params[:id])
  end
end
