class CreateRepositoryProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :repository_projects do |t|
      t.references :repository, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
