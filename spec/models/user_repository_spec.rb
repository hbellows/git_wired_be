require 'rails_helper'

describe UserRepository do
it { should belong_to(:repository) } 
it { should belong_to(:user) } 
end
