require 'rails_helper'

describe Project do
  it { should have_many(:repositories) }
  it { should have_many(:columns) } 
end
