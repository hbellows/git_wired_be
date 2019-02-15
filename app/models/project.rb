class Project
  attr_reader :id,
              :project_name,
              :project_state, 
              :creator,
              :creator_id,
              :updated_at

  def initialize(data)
    @id = data[:id]
    @project_name = data[:name]
    @project_state = data[:state]
    @creator = data[:creator][:login]
    @creator_id = data[:creator][:id]
    @updated_at = Time.parse(data[:updated_at]).strftime('%B %e, %Y')
  end
end