require 'rails_helper'

describe GithubService do
  
  subject { GithubService.new }

  it 'exists' do
    expect(subject).to be_a(GithubService)
  end

  context 'Instance Methods' do
    it 'returns #project_data' do
      # VCR.use_cassette('project_data') do
        response = subject.project_data('hbellows')

        expect(response).to be_a(Hash)
        # expect(response).to have_key(:results)
        # expect(response[:results]).to be_a(Array)
        # expect(response[:results][0][:geometry][:location]).to have_key(:lat)
        # expect(response[:results][0][:geometry][:location]).to have_key(:lng)
      # end
    end
  end
end