require 'rails_helper'

describe RepoProject do
  it 'can be created with attributes' do
    attributes = {
      id: 1,
      name:'Project Repo', 
      state: "open",
      creator: {
              login: 'Grace Hopper',
              id: 7
              },
      updated_at: "2019-02-13T19:15:16Z",
    }

    repo_project = RepoProject.new(attributes)

    expect(repo_project.id).to eq(1)
    expect(repo_project.name).to eq('Project Repo')
    expect(repo_project.state).to eq('open')
    expect(repo_project.creator).to eq('Grace Hopper')
    expect(repo_project.creator_id).to eq(7)
    expect(repo_project.updated_at).to eq('February 13, 2019')
  end
end