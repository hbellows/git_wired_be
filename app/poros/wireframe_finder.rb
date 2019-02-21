class WireframeFinder

  def initialize(user, repository)
    @user = user
    @repository = repository
  end

  def repository
    @repository.name
  end

  def wireframes
    @repository.wireframes.map do |data|
      Wireframer.new(data)
    end
  end

end