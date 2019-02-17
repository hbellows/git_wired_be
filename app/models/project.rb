class Project < ApplicationRecord
  
  has_many :repositories
  has_many :columns

end
