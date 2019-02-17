class CreateProjectColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :project_columns do |t|
      t.references :project, foreign_key: true
      t.references :column, foreign_key: true

      t.timestamps
    end
  end
end
