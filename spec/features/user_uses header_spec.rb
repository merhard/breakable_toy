require 'spec_helper'

describe 'using the header' do
  before(:each) { visit root_path }

  it 'displays app name' do
    expect(page).to have_content('CourtSide')
  end

  it 'links to root page' do
    visit search_path
    click_on 'CourtSide'
    expect(current_path).to eq(root_path)
  end

  it 'has search link' do
    expect(page).to have_selector('a', text: 'Search')
  end

  it 'has add a court link' do
    expect(page).to have_selector('a', text: 'Add a Court')
  end

  it 'links to search page' do
    click_on 'Search'
    expect(current_path).to eq(search_path)
  end

end
