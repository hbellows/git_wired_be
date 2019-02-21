class ApplicationController < ActionController::API
  before_action :authenticated?

  def current_user
    if json_web_token?
      user_id = JsonWebToken.decode(read_token_from_request)
      User.find(user_id["user_id"])
    elsif params["action"] == "authenticate"
      return true
    end
  end

private

  def authenticated?
    user = current_user
    if !user
      render json: {error: "unauthorized"}, status: 401
    else
      true
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
