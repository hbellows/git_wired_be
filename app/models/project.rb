class Project 

  def initialize(data)
    @project_url = data[:url]
    @project_name = data[:name]
    @project_description = data[:body]
    @user = data[:creator][:login]
    @user_id = data[:creator][:id]
    @user_url = data[:creator][:html_url]
    @repos_url = data[:creator][:repos_url]
  end
end