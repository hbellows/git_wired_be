require 'rails_helper'

describe GithubService do
  
  user = User.create(email: 'harper.bellows@gmail.com', user_name: 'hbellows', github_id: '35637783', token: "#{ENV['GITHUB_API_KEY']}")
  subject { GithubService.new(user.token) }

  it 'exists' do
    expect(subject).to be_a(GithubService)
  end
  
  context 'Instance Methods' do
    it 'returns #find_repos' do
      VCR.use_cassette('find_repos') do
        response = subject.find_repos('hbellows')

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

    it 'returns #find_repo_projects' do
      VCR.use_cassette('find_repo_projects') do
        response = subject.find_repo_projects('hbellows', 'git_wired_be')
        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
        expect(response[0][:name]).to be_a(String)
        expect(response[0][:state]).to be_a(String)
        expect(response[0][:creator][:login]).to be_a(String)
        expect(response[0][:creator][:id]).to be_a(Integer)
        expect(response[0][:updated_at]).to be_a(String)
      end
    end
    
    it 'returns #find_project_columns' do
      VCR.use_cassette('find_project_columns') do
        response = subject.find_project_columns(2166821)
      
        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
        expect(response[0][:name]).to be_a(String)
        expect(response[0][:updated_at]).to be_a(String)
      end
    end

    it 'returns #find_column_cards' do
      VCR.use_cassette('find_column_cards') do
        response = subject.find_column_cards(4407129)

        expect(response).to be_a(Array)
        expect(response[0][:id]).to be_a(Integer)
      end
    end

    it 'returns #find_card' do
      VCR.use_cassette('find_card') do
        response = subject.find_card(17625549)

        expect(response).to be_a(Hash)
        expect(response[:id]).to be_a(Integer)
      end
    end
  end
end