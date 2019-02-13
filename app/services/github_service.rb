class GithubService

  def location_data(login)
    get_json("#{login}")
  end

  private

  def conn
    Faraday.new(url: '') do |faraday|
      faraday.params['key'] = ENV['GITHUB_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end