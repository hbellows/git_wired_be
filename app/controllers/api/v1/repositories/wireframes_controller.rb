class Api::V1::Repositories::WireframesController < ApplicationController

  def index
    render json: WireframesSerializer.new(wireframes).serialized_json
  end

  private
  
  def wireframes
    @wireframes ||= WireframeFinder.new(current_user)
  end
end