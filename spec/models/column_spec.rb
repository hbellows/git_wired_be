require 'rails_helper'

describe Column do
  it { should have_many(:cards) }
  it { should have_many(:projects).through(:project_columns) }  
end
