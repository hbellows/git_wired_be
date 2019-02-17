require 'rails_helper'

describe RepositoryProject do
  it { should belong_to(:repository) } 
  it { should belong_to(:project) } 
end
