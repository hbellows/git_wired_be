require 'rails_helper'

describe Repository do
  it { should have_many(:users).through(:user_repositories) }  
  it { should have_many(:projects).through(:repository_projects) }  
end
