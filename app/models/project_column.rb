class ProjectColumn < ApplicationRecord
  belongs_to :project
  belongs_to :column
end
