class RepositoryFinder

  attr_reader :login
  
  def initialize(login)
    @login = login
  end

  def repos
    repos_data.map do |data|
      Repo.new(data)
    end
  end

  private

  def github_service
    @github_service ||= GithubService.new
  end

  def repos_data
    github_service.find_repos(@login)
  end
end