class ProjectFinder


  def initialize(login)
    @login = login
  end

  def repos
    repos_data.map do |data|
      Repo.new(data)
    end
  end

  def repo_projects
    repo_projects_data.map do |data|
      Project.new(data)
    end
  end

  private

  def github_service
    @github_service ||= GithubService.new
  end

  def repos_data
    github_service.find_repos(@login)
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

  def card_data
    github_service.find_card(card_id)
  end
end