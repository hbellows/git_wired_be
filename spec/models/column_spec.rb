require 'rails_helper'

describe Column do
  it { should have_many(:cards) } 
end
