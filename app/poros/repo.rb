class Repo

  attr_reader :id,
              :name,
              :github_id,
              :html_url

  def initialize(data)
    @id = data.id
    @name = data.name
    @github_id = data.github_id
    @html_url = data.html_url
  end
end
