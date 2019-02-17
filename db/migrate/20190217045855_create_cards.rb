class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :github_id
      t.references :column, foreign_key: true

      t.timestamps
    end
  end
end
