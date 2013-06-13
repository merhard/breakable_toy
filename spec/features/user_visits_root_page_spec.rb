require 'spec_helper'

describe 'visiting the root page' do
  it 'exists' do
    visit '/'
    expect(page.status_code).to eq(200)
  end

  it 'shows list of sports site supports' do
    sport = FactoryGirl.create(:sport)

    visit '/'

    expect(page).to have_content(sport.name)
  end


end
