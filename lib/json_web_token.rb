require 'jwt'

class JsonWebToken

  def self.issue(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, ENV['AUTH_SECRET'], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token,
    ENV['AUTH_SECRET'],
    true,
    { algorithm: 'HS256' }).first
  end
end
