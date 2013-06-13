require 'spec_helper'

describe 'using the nav-bar' do
  it 'links to search page' do
    visit '/'
    click_on 'Search'
    expect(current_path).to eq('/search')
  end




end
