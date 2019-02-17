class ProjectFinder


  def initialize(login, repo_id)
    @login = login
    @repo_id = repo_id
  end

  def repo_projects
    repo_projects_data.map do |data|
      
  end

  def repository_projects
    repo_projects.map do |project|
      RepoProject.new(project)
    end
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

  def repo_projects_data
    github_service.find_repo_projects(login, repo)
  end

  def project_columns_data
    github_service.find_project_columns(project_id)
  end

  def column_cards_data
    github_service.find_project_cards(column_id)
  end

  # def card_data
  #   github_service.find_card(card_id)
  # end
end