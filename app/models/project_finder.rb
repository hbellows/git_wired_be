class ProjectFinder


  def initialize(login)
    @login = login
  end

  def github_user_projects
    github_data.map do |project_data|
      Project.new(project_data)
    end
  end

  private

  def github_service
    @github_service ||= GithubService.new
  end

  def github_data
    github_service.find_projects(@login)
  end
end