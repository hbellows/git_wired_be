require 'rails_helper'

describe 'user visits /api/v1/repositories' do
  context 'GET request' do
    it 'it returns a list of repositories for a specific github user' do
      VCR.use_cassette('get_repositories') do
        user_name = 'hbellows'
        
        get "/api/v1/repositories?user_name=#{user_name}"

        expect(response.status).to eq(200)

        returned_repositories = JSON.parse(response.body, symbolize_names: true)

        expect(returned_repositories).to be_a(Hash)
        expect(returned_repositories).to have_key(:data)
        expect(returned_repositories[:data]).to have_key(:id)
        expect(returned_repositories[:data][:id]).to eq(user_name)
        expect(returned_repositories[:data]).to have_key(:attributes)
        expect(returned_repositories[:data][:attributes]).to have_key(:repositories)
        expect(returned_repositories[:data][:attributes][:repositories]).to be_a(Array)
        expect(returned_repositories[:data][:attributes][:repositories][0]).to have_key(:id)
        expect(returned_repositories[:data][:attributes][:repositories][0]).to have_key(:name)
        expect(returned_repositories[:data][:attributes][:repositories][0]).to have_key(:github_id)
      end
    end
  end
end