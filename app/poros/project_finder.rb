class ProjectFinder

  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def repository
    @repo.name
  end

  def repo_projects
    repo_projects_data.map do |data|
      @repo.projects.find_or_create_by(title: data[:name], description: data[:body], github_id: data[:id])
    end 
  end

  def repository_projects
    repo_projects_data.map do |project|
      RepoProject.new(project, @repo.id)
    end
  end


  private

  def github_service
    @github_service ||= GithubService.new(@user.token)
  end

  def repo_projects_data
    github_service.find_repo_projects(@user.user_name, @repo.name)
  end
end