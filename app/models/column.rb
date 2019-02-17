class Column < ApplicationRecord
  has_many :projects, through: :project_columns
  has_many :cards
end
