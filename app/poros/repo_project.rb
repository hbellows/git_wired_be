class RepoProject
  
  attr_reader :repo_id,
              :project_id, 
              :name, 
              :state,
              :creator,
              :creator_id,
              :created_at,
              :updated_at

  def initialize(data, repo_id)
    @repo_id = repo_id
    @project_id = data[:id]
    @name = data[:name]
    @state = data[:state]
    @creator = data[:creator][:login]
    @creator_id = data[:creator][:id]
    @created_at = Time.parse(data[:created_at]).strftime('%B %d, %Y')
    @updated_at = Time.parse(data[:updated_at]).strftime('%B %d, %Y')
  end
end