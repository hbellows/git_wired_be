class ChangeRepositoryUsersToUserRepositories < ActiveRecord::Migration[5.2]
  def change
    rename_table :repository_users, :user_repositories
  end
end
