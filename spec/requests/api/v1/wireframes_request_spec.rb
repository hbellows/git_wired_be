require 'rails_helper'

describe 'GET requests' do
  context 'user visits /api/v1/repositories/:id/wireframes' do
    it 'it returns a list of wireframes for a specific github user\'s repository' do
      VCR.use_cassette('get_wireframes') do

        user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')
      
        repository_id = repository.id

        get "/api/v1/repositories/#{repository_id}/wireframes"

        expect(response.status).to eq(200)

        returned_wireframes = JSON.parse(response.body, symbolize_names: true)
        expect(returned_wireframes).to be_a(Hash)
        expect(returned_wireframes).to have_key(:data)
        expect(returned_wireframes[:data]).to have_key(:id)
        expect(returned_wireframes[:data][:id]).to eq(repository.name)
        expect(returned_wireframes[:data]).to have_key(:attributes)
        expect(returned_wireframes[:data][:attributes]).to have_key(:repository_wireframes)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes]).to be_a(Array)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:project_id)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:name)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:state)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:creator)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:created_at)
        expect(returned_wireframes[:data][:attributes][:repository_wireframes][0]).to have_key(:updated_at)
      end
    end
  end