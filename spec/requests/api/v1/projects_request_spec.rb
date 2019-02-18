require 'rails_helper'

describe 'user visits /api/v1/projects' do
  context 'GET request' do
    it 'it returns a list of projects for a specific github user repository' do
      VCR.use_cassette('get_projects') do

        user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')
      
        repository_id = repository.id

        get "/api/v1/repositories/#{repository_id}/projects"

        expect(response.status).to eq(200)

        returned_projects = JSON.parse(response.body, symbolize_names: true)

        expect(returned_projects).to be_a(Hash)
        expect(returned_projects).to have_key(:data)
        expect(returned_projects[:data]).to have_key(:id)
        expect(returned_projects[:data][:id]).to eq(repository.name)
        expect(returned_projects[:data]).to have_key(:attributes)
        expect(returned_projects[:data][:attributes]).to have_key(:repository_projects)
        expect(returned_projects[:data][:attributes][:repository_projects]).to be_a(Array)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:project_id)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:name)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:state)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:creator)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:created_at)
        expect(returned_projects[:data][:attributes][:repository_projects][0]).to have_key(:updated_at)
      end
    end
  end
end