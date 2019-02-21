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

  def wireframe(wireframe_id)
    @repository.wireframes.find(wireframe_id)
  end

end
