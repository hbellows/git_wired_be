class Api::V1::GithubController < ApiController

  def show
    render json: ProjectSerializer.new(project).serialized_json
  end

  private

  def forecast
    @forecast ||= ForecastFinder.new(params[:location])
  end
end