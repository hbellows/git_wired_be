require 'rails_helper'

describe RepositoryUser do
it { should belong_to(:repository) } 
it { should belong_to(:user) } 
end
