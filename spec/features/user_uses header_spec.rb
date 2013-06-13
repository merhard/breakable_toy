require 'spec_helper'

describe 'using the header' do
  it 'displays app name' do
    visit '/'
    expect(page).to have_content('Sport Finder')
  end

  it 'links to root page' do
    visit '/search'
    click_on 'Sport Finder'
    expect(current_path).to eq('/')
  end




end