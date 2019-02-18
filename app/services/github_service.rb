class GithubService

  def initialize(token)
    @token = token
  end

  def find_repos(login)
    get_json("/users/#{login}/repos?sort=updated")
  end
  
  def find_repo_projects(login, repo_name)
    get_json("/repos/#{login}/#{repo_name}/projects")
  end
  
  def find_project_columns(project_id)
    get_json("/projects/#{project_id}/columns")
  end


  def find_column_cards(column_id)
    get_json("/projects/columns/#{column_id}/cards")
  end

  def find_card(card_id)
    get_json("/projects/columns/cards/#{card_id}")
  end

  private

  def conn
    Faraday.new(:url => 'https://api.github.com/') do |faraday|
      faraday.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
      faraday.headers['Authorization'] = "token #{@token}"
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



