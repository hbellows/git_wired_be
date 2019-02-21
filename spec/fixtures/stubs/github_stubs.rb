
module GithubStubs

  def stub_issues
    stub_request(:get, "https://api.github.com/repos/jordanwa1947/sweater-weather-fe/issues").
      to_return(body: File.read("./spec/fixtures/stubs/issues.json"))
  end

end
