class Repo 

  attr_reader :id,
              :name,
              :github_id

  def initialize(data)
    @id = data.id
    @name = data.name
    @github_id = data.github_id
  end
end