class Repository < ApplicationRecord
  has_many :user_repositories
  has_many :users, through: :user_repositories
  
  has_many :repository_projects
  has_many :projects, through: :repository_projects
end
