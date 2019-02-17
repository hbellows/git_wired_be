class RepositoryProject < ApplicationRecord
  belongs_to :repository
  belongs_to :project
end
