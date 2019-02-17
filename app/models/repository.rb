class Repository < ApplicationRecord
  has_many :users, through: :user_repositories
  has_many :projects, through: :repository_projects
end
