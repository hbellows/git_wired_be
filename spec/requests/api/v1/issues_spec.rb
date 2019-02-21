require 'rails_helper'

RSpec.describe Api::V1::Repositories::IssuesController, type: :controller do
  context 'GET request' do

    let(:headers) { { 'HTTP_AUTHORIZATION' => "Bearer: #{JsonWebToken.issue(1)}" } }

    before(:each) do
      request.headers.merge!(headers)
    end

    it 'it returns a repository, project and issues for a specific github user' do
      user = create(:user)
      repository = create(:repository)
      create(:user_repository, repository_id: repository.id, user_id: user.id)

      stub_issues

      get :index, params: {repository_id: 1}, format: :json, as: :json

      expect(response.status).to eq(200)

      returned_issues = JSON.parse(response.body, symbolize_names: true)

      expect(returned_issues[:issues].count).to eq(2)
      expect(returned_issues[:issues][0][:github_id]).to eq(412133128)
      expect(returned_issues[:issues][0][:github_number]).to eq(5)
      expect(returned_issues[:issues][0][:github_html_url]).to eq("https://github.com/jordanwa1947/sweater-weather-fe/issues/5")
      expect(returned_issues[:issues][0][:github_title]).to eq("User story #10")
      expect(returned_issues[:issues][0][:github_body]).to eq("As a general user with a pre-existing account, when I visit the home page without being logged in and click on sign in link, I'm taken to a login page with email and password fields.")
      expect(returned_issues[:issues][0][:github_state]).to eq("open")
    end
  end
end
