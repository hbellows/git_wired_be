class Repo
  attr_reader :id,
              :repo_name, 
              :owner,
              :owner_id,
              :updated_at,
              :has_projects,
              :open_issues

  def initialize(data)
    @id = data[:id]
    @repo_name = data[:name]
    @owner = data[:owner][:login]
    @owner_id = data[:owner][:id]
    @updated_at = Time.parse(data[:updated_at]).strftime('%B %e, %Y')
    @has_projects = data[:has_projects]
    @open_issues = data[:open_issues]
  end
end