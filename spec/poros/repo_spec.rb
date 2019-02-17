require 'rails_helper'

describe Repo do
  it 'can be created with attributes' do
    attributes = {
                  id: 1,
                  name:'My Repo', 
                  owner: {
                          login: 'Grace Hopper',
                          id: 7
                          },
                  updated_at: "2019-02-13T19:15:16Z",
                  has_projects: true,
                  open_issues: 2
                }
    
    repo = Repo.new(attributes)

    expect(repo.id).to eq(1)
    expect(repo.repo_name).to eq('My Repo')
    expect(repo.owner).to eq('Grace Hopper')
    expect(repo.owner_id).to eq(7)
    expect(repo.updated_at).to eq('February 13, 2019')
    expect(repo.has_projects).to eq(true)
    expect(repo.open_issues).to eq(2)
  end
end