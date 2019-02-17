class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :user_name
      t.string :github_id
      t.string :token

      t.timestamps
    end
  end
end
