class Column < ApplicationRecord
  has_many :projects
  has_many :cards
end