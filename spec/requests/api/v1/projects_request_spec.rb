require 'rails_helper'

describe 'user visits /api/v1/projects' do
  context 'GET request' do
    it 'it returns a list of projects for a specific github user repository' do
      VCR.use_cassette('get_projects') do
        repository_id = '170214553'
        
        get "/api/v1/repositories/#{repository_id}/projects"

        expect(response.status).to eq(200)

        returned_projects = JSON.parse(response.body, symbolize_names: true)

        expect(returned_projects).to be_a(Hash)
        expect(returned_projects).to have_key(:data)
        expect(returned_projects[:data]).to have_key(:id)
        expect(returned_projects[:data][:id]).to eq(user_name)
        expect(returned_projects[:data]).to have_key(:attributes)
        expect(returned_projects[:data][:attributes]).to have_key(:projects)
        # expect(returned_projects[:data][:attributes][:projects]).to be_a(Array)
        # expect(returned_projects[:data][:attributes][:projects][0]).to have_key(:id)
        # expect(returned_projects[:data][:attributes][:projects][0]).to have_key(:name)
        # expect(returned_projects[:data][:attributes][:projects][0]).to have_key(:github_id)
      end
    end
  end
end