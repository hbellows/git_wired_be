class Api::V1::Repositories::IssuesController < ApplicationController

  def index
    repository = Repository.find(params["repository_id"])
    facade = IssueFinder.new(current_user, repository.name)
    issues = facade.find_issues
    render json: {repos: repository, issues: issues}
  end
end
