class Api::V1::Repositories::RepositoriesController < ApiController

def index
  render json: RepositorySerializer.new(repositories).serialized_json
end

private

def repositories
  @repositories ||= RepositoryFinder.new(params[:user_name])
end

end