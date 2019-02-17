class Column < ApplicationRecord
  has_many :cards

  has_many :project_columns
  has_many :projects, through: :project_columns
end
