require 'rails_helper'

describe 'GET requests' do
  context 'user visits /api/v1/repositories/:id/projects' do
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
  
  context 'user visits /api/v1/repositories/:id/projects/:id' do
    it 'it returns a list of columns and cards for each column for a specific project' do
      # VCR.use_cassette('get_project_columns') do
      
        user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')
        project = repository.projects.create!(title: 'git_wired_be', description: 'API for frontend project', github_id: 2166821)
        
        repository_id = repository.id
        id = project.id
      
        get "/api/v1/repositories/#{repository_id}/projects/#{id}"
        
        expect(response.status).to eq(200)
        
        returned_columns = JSON.parse(response.body, symbolize_names: true)

        expect(returned_columns).to be_a(Hash)
        expect(returned_columns).to have_key(:data)
        expect(returned_columns[:data]).to have_key(:id)
        expect(returned_columns[:data][:id]).to eq(project.title)
        expect(returned_columns[:data]).to have_key(:attributes)
        expect(returned_columns[:data][:attributes]).to have_key(:column_cards)
        expect(returned_columns[:data][:attributes][:column_cards]).to be_a(Array)
        expect(returned_columns[:data][:attributes][:column_cards][0]).to have_key(:column_name)
        expect(returned_columns[:data][:attributes][:column_cards][0][:column_name]).to be_a(String)
        expect(returned_columns[:data][:attributes][:column_cards][0]).to have_key(:cards)
        expect(returned_columns[:data][:attributes][:column_cards][0][:cards]).to be_a(Array)
      # end
    end
  end
end