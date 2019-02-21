class CreateRepositoryWireframes < ActiveRecord::Migration[5.2]
  def change
    create_table :repository_wireframes do |t|
      t.references :wireframe, foreign_key: true
      t.references :repository, foreign_key: true

      t.timestamps
    end
  end
end
