require 'rails_helper'

describe 'GET requests' do
  context 'user visits /api/v1/repositories/:id/wireframes' do
    it 'it returns a list of wireframes for a specific github user\'s repository' do
      # VCR.use_cassette('get_wireframes') do

        user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')
        wireframe_1 = repository.wireframes.create!(name: "Wireframe 1", object: "Description 1")
        wireframe_2 = repository.wireframes.create!(name: "Wireframe 2", object: "Description 2")

        repository_id = repository.id

        get "/api/v1/repositories/#{repository_id}/wireframes"
        expect(response.status).to eq(200)

        returned_wireframes = JSON.parse(response.body, symbolize_names: true)

        expect(returned_wireframes).to be_a(Hash)
        expect(returned_wireframes).to have_key(:data)
        expect(returned_wireframes[:data]).to have_key(:id)
        expect(returned_wireframes[:data][:id]).to eq(repository.name)
        expect(returned_wireframes[:data]).to have_key(:attributes)
        expect(returned_wireframes[:data][:attributes]).to have_key(:wireframes)
        expect(returned_wireframes[:data][:attributes][:wireframes]).to be_a(Array)
        expect(returned_wireframes[:data][:attributes][:wireframes][0]).to have_key(:id)
        expect(returned_wireframes[:data][:attributes][:wireframes][0][:id]).to equal(wireframe_1.id)
        expect(returned_wireframes[:data][:attributes][:wireframes][0]).to have_key(:name)
        expect(returned_wireframes[:data][:attributes][:wireframes][0][:name]).to eq(wireframe_1.name)
        expect(returned_wireframes[:data][:attributes][:wireframes][0]).to have_key(:object)
        expect(returned_wireframes[:data][:attributes][:wireframes][0][:object]).to eq(wireframe_1.object)
        expect(returned_wireframes[:data][:attributes][:wireframes][0]).to have_key(:created_at)
        expect(returned_wireframes[:data][:attributes][:wireframes][0]).to have_key(:updated_at)
        expect(returned_wireframes[:data][:attributes][:wireframes][1][:id]).to equal(wireframe_2.id)
        expect(returned_wireframes[:data][:attributes][:wireframes][1]).to have_key(:name)
        expect(returned_wireframes[:data][:attributes][:wireframes][1][:name]).to eq(wireframe_2.name)
        expect(returned_wireframes[:data][:attributes][:wireframes][1]).to have_key(:object)
        expect(returned_wireframes[:data][:attributes][:wireframes][1][:object]).to eq(wireframe_2.object)
        expect(returned_wireframes[:data][:attributes][:wireframes][1]).to have_key(:created_at)
        expect(returned_wireframes[:data][:attributes][:wireframes][1]).to have_key(:updated_at)
      # end
    end
  end

  context 'user visits /api/v1/repositories/:id/wireframes/:id' do
    it 'it returns the requested wireframe for a specific github user\'s repository' do

        user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')
        wireframe_1 = repository.wireframes.create!(name: "Wireframe 1", object: "Description 1")
        wireframe_2 = repository.wireframes.create!(name: "Wireframe 2", object: "Description 2")

        repository_id = repository.id

        get "/api/v1/repositories/#{repository_id}/wireframes/#{wireframe_2.id}"
        expect(response.status).to eq(200)

        returned_wireframe = JSON.parse(response.body, symbolize_names: true)

        expect(returned_wireframe).to be_a(Hash)
        expect(returned_wireframe).to have_key(:data)
        expect(returned_wireframe[:data]).to have_key(:repo)
        expect(returned_wireframe[:data][:repo]).to eq(repository.name)
        expect(returned_wireframe[:data]).to have_key(:attributes)
        expect(returned_wireframe[:data][:attributes]).to have_key(:id)
        expect(returned_wireframe[:data][:attributes][:id]).to equal(wireframe_2.id)
        expect(returned_wireframe[:data][:attributes]).to have_key(:name)
        expect(returned_wireframe[:data][:attributes][:name]).to eq(wireframe_2.name)
        expect(returned_wireframe[:data][:attributes]).to have_key(:object)
        expect(returned_wireframe[:data][:attributes][:object]).to eq(wireframe_2.object)
        expect(returned_wireframe[:data][:attributes]).to have_key(:created_at)
        expect(returned_wireframe[:data][:attributes]).to have_key(:updated_at)
    end
  end
end


describe 'POST request' do
  context 'user sends request to /api/v1/repositories/:repository_id/wireframes' do
    it 'creates a new wireframe for a project and returns status 201 and a message' do
      user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      repository = user.repositories.create!(name: 'git_wired_be', github_id: '170214553')

      repository_id = repository.id

      payload = {
        name: "New Wireframe",
        object: "The new hotness"
      }

      post "/api/v1/repositories/#{repository_id}/wireframes", params: payload

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json_response[:message]).to eq("Wireframe successfully created")
      expect(json_response[:repo_id]).to eq(repository_id)
      expect(json_response[:wireframe][:name]).to eq("New Wireframe")
      expect(json_response[:wireframe][:object]).to eq("The new hotness")
    end
  end
end
