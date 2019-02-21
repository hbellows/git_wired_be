require 'rails_helper'

describe Wireframe do
  it { should have_many(:repository_wireframes) } 
  it { should have_many(:repositories).through(:repository_wireframes) } 
end
