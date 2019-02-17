class User < ApplicationRecord
  validates_presence_of :token, :login, :github_id

  has_many :repositories

  def self.find_or_create(auth)
    find_or_create_by(github_id: auth[:id]) do |u|
      u.email = auth[:email]
      u.token = auth[:token]
      u.user_name = auth[:login]
      u.github_id = auth[:id]
    end
  end

end
