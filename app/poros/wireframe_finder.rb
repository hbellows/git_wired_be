class WireframeFinder

  def initialize(user, repository, wireframe_id)
    @user = user
    @repository = repository
    @wireframe_id = wireframe_id
  end

  def repository
    @repository.name
  end

  def wireframes
    @repository.wireframes.map do |data|
      Wireframer.new(data)
    end
  end

  def wireframe
    @repository.wireframes.find(@wireframe_id)
  end

end
