require 'rails_helper'

describe GithubService do
  
  subject { GithubService.new }

  it 'exists' do
    expect(subject).to be_a(GithubService)
  end
  
  context 'Instance Methods' do
    it 'returns #repo_data' do
      VCR.use_cassette('repo_data') do
        response = subject.repo_data('hbellows')
  
        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
        expect(response[0][:name]).to be_a(String)
        expect(response[0][:owner][:login]).to be_a(String)
        expect(response[0][:owner][:id]).to be_a(Integer)
        expect(response[0][:updated_at]).to be_a(String)
        expect(response[0][:has_projects]).to equal(true || false)
        expect(response[0][:open_issues]).to be_a(Integer)
      end
    end

    it 'returns #repo_projects' do
      VCR.use_cassette('repo_projects') do
        response = subject.repo_projects('hbellows', 'git_wired_be')
        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
        expect(response[0][:name]).to be_a(String)
        expect(response[0][:state]).to be_a(String)
        expect(response[0][:creator][:login]).to be_a(String)
        expect(response[0][:creator][:id]).to be_a(Integer)
        expect(response[0][:updated_at]).to be_a(String)
      end
    end
    
    it 'returns #project_columns' do
      VCR.use_cassette('project_columns') do
        response = subject.project_columns(2166821)
      
        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
        expect(response[0][:name]).to be_a(String)
        expect(response[0][:updated_at]).to be_a(String)
      end
    end

    it 'returns #project_cards' do
      VCR.use_cassette('project_cards') do
        response = subject.project_cards(4407129)

        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
      end
    end

    it 'returns #card_data' do
      VCR.use_cassette('card_data') do
        response = subject.card_data(17625549)

        expect(response).to be_a(Hash)
        expect(response[:id]).to be_a(Integer)
      end
    end
  end
end