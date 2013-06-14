require 'spec_helper'

describe 'using the nav-bar' do

  before(:each) { visit '/' }

  it 'has search link' do
    expect(page).to have_selector('a', text: 'Search')
  end

  it 'has add a court link' do
    expect(page).to have_selector('a', text: 'Add a Court')
  end

  it 'links to search page' do
    click_on 'Search'
    expect(current_path).to eq('/search')
  end




end
