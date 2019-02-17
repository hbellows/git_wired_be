require 'rails_helper'

describe Repository do
  it { should have_many(:users) } 
  it { should have_many(:projects) } 
end
