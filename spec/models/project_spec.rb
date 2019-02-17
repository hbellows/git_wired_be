require 'rails_helper'

describe Project do
  it { should have_many(:repositories).through(:repository_projects) } 
  it { should have_many(:columns).through(:project_columns) } 
end
