class RepoProject
  
  attr_reader :id,
              :name, 
              :state,
              :creator,
              :creator_id,
              :updated_at

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @state = data[:state]
    @creator = data[:creator][:login]
    @creator_id = data[:creator][:id]
    @updated_at = Time.parse(data[:updated_at]).strftime('%B %e, %Y')
  end
end