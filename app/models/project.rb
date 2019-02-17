class Project < ApplicationRecord
  has_many :repositories, through: :repository_projects
  has_many :columns, through: :project_columns
end
