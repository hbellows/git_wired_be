require 'rails_helper'

describe ProjectColumn do
  it { should belong_to(:project) } 
  it { should belong_to(:column) } 
end
