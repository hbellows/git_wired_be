class Project < ApplicationRecord
  has_many :repository_projects
  has_many :repositories, through: :repository_projects
  
  has_many :project_columns
  has_many :columns, through: :project_columns
end
