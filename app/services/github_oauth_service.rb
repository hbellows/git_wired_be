class GithubOauthService

  def initialize(params)
    @code = params[:code]
  end

  def oauth
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}&code=#{@code}")
    response_hash = parse_response(response)
    token = response_hash["access_token"]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body, symbolize_names: true)
    auth[:token] = token
    auth
  end

  def parse_response(response)
    pairs = response.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end
    response_hash
  end
end
