class Wireframer

  def initialize(data)
    @name = data[:name]
    @object = data[:object]
    @created_at = Time.parse(data[:created_at]).strftime('%B %d, %Y')
    @updated_at = Time.parse(data[:updated_at]).strftime('%B %d, %Y')
  end
end