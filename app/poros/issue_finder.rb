class IssueFinder

  def initialize(username, repo_name)
    @username = username
    @repo_name = repo_name
  end

  def find_issues
    array_o_issues = github_service.find_issues(@username.user_name, @repo_name)
    array_o_issues.map do |issue|
      hash = {}
      hash[:github_id] = issue[:id]
      hash[:github_number] = issue[:number]
      hash[:github_html_url] = issue[:html_url]
      hash[:github_title] = issue[:title]
      hash[:github_body] = issue[:body]
      hash[:github_state] = issue[:state]
      hash
    end
  end

  private

  def github_service
    @github_service ||= GithubService.new
  end
end
