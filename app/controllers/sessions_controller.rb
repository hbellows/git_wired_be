class SessionsController < ApplicationController

  def create
    github_oauth = GithubOauthService.new(params)
    auth = github_oauth.oauth
    user = User.find_or_create(auth)
    if user.token
      jwt = JsonWebToken.issue(user.id)
      redirect_to("https://git-wired.herokuapp.com/?token=#{jwt}")
    end
  end

  def authenticate
    redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_KEY']}&scope=repo,user:email"
  end
end
