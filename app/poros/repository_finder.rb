class RepositoryFinder

  attr_reader :github_handle
  
  def initialize(user)
    @user = user
  end

  def github_handle
    @user.user_name
  end

  # def repos
  #   repos_data.map do |data|
  #     Repository.find_or_create_by(name: data[:name], github_id: data[:id])
  #   end
  # end

  # TODO: UPDATE THE ABOVE METHOD ONCE OAUTH IS WORKING
  def repos
    repos_data.map do |data|
      @user.repositories.find_or_create_by(name: data[:name], github_id: data[:id])
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
    github_service.find_repos(@user.user_name)
  end
end