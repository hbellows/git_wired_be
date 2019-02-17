require 'rails_helper'

xdescribe Repository do
  it { should have_many(:users) } 
  it { should have_many(:projects) } 
end
