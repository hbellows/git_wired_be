class ApplicationController < ActionController::API
  before_action :logged_in?

  def current_user
    return @current_user if @current_user
  end

  def logged_in?
    if json_web_token?
      github_id = Auth.decode(read_token_from_request)
      @current_user = User.find_by({github_id: github_id})
      authenticated?(@current_user)
    end
  end

private

  def authenticated?(user)
    if user
      render json: {error: "unauthorized"}, status: 401
    else
      return user
    end
  end

  def read_token_from_request
    token = request.env["HTTP_AUTHORIZATION"]
                   .scan(/Bearer: (.*)$/).flatten.last
  end

  def json_web_token?
    !!request.env.fetch("HTTP_AUTHORIZATION", "")
             .scan(/Bearer/).flatten.first
  end
end
