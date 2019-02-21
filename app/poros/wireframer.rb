class Wireframer

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @object = data[:object]
    @created_at = Time.at(data[:created_at]).strftime('%B %d, %Y')
    @updated_at = Time.at(data[:updated_at]).strftime('%B %d, %Y')
  end
end