class Repo 

  attr_reader :name,
              :github_id

  def initialize(data)
    @name = data[:name]
    @github_id = data[:github_id]
  end
end