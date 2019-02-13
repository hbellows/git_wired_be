require 'rails_helper'

describe 'Visitor visits root page' do
  it 'should display simple welcome message' do
    visit '/'

    expect(page).to have_content('Git Wired Endpoints')
  end
end