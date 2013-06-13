require 'spec_helper'

describe 'visiting the root page' do
  it 'exists' do
    visit '/'
    expect(page.status_code).to eq(200)
  end

  it 'displays app name' do
    visit '/'
    expect(page).to have_content('Sport Finder')
  end

  it 'shows list of sports site supports' do
    sport = FactoryGirl.create(:sport)

    visit '/'

    expect(page).to have_content(sport.name)
  end

  it 'has search link' do
    visit '/'
    expect(page).to have_selector('a', text: 'Search')
  end

  it 'has add a court link' do
    visit '/'
    expect(page).to have_selector('a', text: 'Add a Court')
  end
end
