class GithubService

  def repo_data(login)
    get_json("/users/#{login}/repos?sort=updated")
  end
  
  def repo_projects(login, repo)
    get_json("/repos/#{login}/#{repo}/projects")
  end
  
  # def project_data(login)
  #   get_json("/users/#{login}/projects")
  # end

  def project_data(login, repo, id)
    get_json("/repos/#{login}/#{repo}/projects/#{id}")
  end

  private

  def conn
    Faraday.new(:url => 'https://api.github.com/') do |faraday|
      faraday.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
      faraday.headers['Authorization'] = "token #{ENV['GITHUB_API_KEY']}"
      faraday.adapter  Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end



# REPOSITORIES
# GET ALL REPOS /users/:username/repos

# PROJECTS
# GET ALL PROJECTS /repos/:owner/:repo/projects

# COLUMNS
# GET /projects/:project_id/columns
# GET /projects/columns/:column_id

# CARDS
# GET ALL CARDS /projects/columns/:column_id/cards
# GET SINGLE CARD /projects/columns/cards/:card_id

# COLLABORATORS
# GET /projects/:project_id/collaborators

# DEPRICATED
# GET /repos/:owner/:repo/projects/:number



