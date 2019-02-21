class Wireframe < ApplicationRecord
  has_many :repository_wireframes
  has_many :repositories, through: :repository_wireframes
end
