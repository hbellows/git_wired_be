class WireframeFinder

  def initialize(user, repository)
    binding.pry
    @user = user
    @repository = repository
  end

  def repository
    @repository.title
  end

  def wireframes
    repository.wireframes.all
  end

end