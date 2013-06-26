require 'spec_helper'

describe 'using the header' do
  it 'displays app name' do
    visit root_path
    expect(page).to have_content('Sport Finder')
  end

  it 'links to root page' do
    visit sports_path
    click_on 'Sport Finder'
    expect(current_path).to eq(root_path)
  end




end
