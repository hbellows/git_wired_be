require 'rails_helper'

xdescribe Project do
  it { should have_many(:repositories) }
  it { should have_many(:columns) } 
end
