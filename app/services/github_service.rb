class GithubService

  def project_data(login)
    get_json("/users/#{login}/projects")
  end

  private

  def conn
    Faraday.new(:url => 'https://api.github.com/') do |faraday|
      faraday.headers['Accept'] = 'application/vnd.github.inertia-preview+json'
      # faraday.headers['Authorization'] = ENV['GITHUB_API_KEY']
      faraday.headers['Authorization'] = ENV['GITHUB_API_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def get_json(url)
    binding.pry
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end


