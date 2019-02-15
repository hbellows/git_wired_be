require 'rails_helper'

describe Project do
  it 'can be created with attributes' do
    attributes = {
                  id: 1,
                  name:'My Project',
                  state: 'open',
                  creator: {
                          login: 'Grace Hopper',
                          id: 7
                          },
                  updated_at: "2019-02-13T19:15:16Z"
                }
    
    project = Project.new(attributes)

    expect(project.id).to eq(1)
    expect(project.project_name).to eq('My Project')
    expect(project.project_state).to eq('open')
    expect(project.creator).to eq('Grace Hopper')
    expect(project.creator_id).to eq(7)
    expect(project.updated_at).to eq('February 13, 2019')
  end
end