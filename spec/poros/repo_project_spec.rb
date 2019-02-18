require 'rails_helper'

describe RepoProject do
  it 'can be created with attributes' do
    repo_id = Repository.create(name: 'My Repo', github_id: '12345').id
    attributes = {
      id: 1,
      name:'Project Repo', 
      state: "open",
      creator: {
              login: 'Grace Hopper',
              id: 7
              },
      created_at: "2019-02-09T19:15:16Z",
      updated_at: "2019-02-13T19:15:16Z",
    }

    repo_project = RepoProject.new(attributes, repo_id)

    expect(repo_project.repo_id).to eq(repo_id)
    expect(repo_project.project_id).to eq(1)
    expect(repo_project.name).to eq('Project Repo')
    expect(repo_project.state).to eq('open')
    expect(repo_project.creator).to eq('Grace Hopper')
    expect(repo_project.creator_id).to eq(7)
    expect(repo_project.created_at).to eq('February 09, 2019')
    expect(repo_project.updated_at).to eq('February 13, 2019')
  end
end