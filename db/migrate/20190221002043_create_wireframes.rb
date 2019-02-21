class CreateWireframes < ActiveRecord::Migration[5.2]
  def change
    create_table :wireframes do |t|
      t.string :name
      t.text :object

      t.timestamps
    end
  end
end
