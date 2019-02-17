class RepositoryFinder

  attr_reader :login
  
  def initialize(login)
    @login = login
  end

  def repos
    repos_data.map do |data|
      Repository.find_or_create_by(name: data[:name], github_id: data[:id])
    end
  end

  def repositories
    repos.map do |data|
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