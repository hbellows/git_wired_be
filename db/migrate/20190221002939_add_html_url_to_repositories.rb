class AddHtmlUrlToRepositories < ActiveRecord::Migration[5.2]
  def change
    add_column :repositories, :html_url, :string
  end
end
