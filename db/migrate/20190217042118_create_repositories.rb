class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :github_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
