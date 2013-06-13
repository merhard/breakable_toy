require 'spec_helper'

describe 'visiting the search page' do
  let!(:sport) { FactoryGirl.create(:sport) }

  it 'exists' do
    visit '/search'
    expect(page.status_code).to eq(200)
  end

  it 'shows list of sports to search by' do
    visit '/search'
    expect(page).to have_content(sport.name)
  end

  it 'has a link for each sport' do
    visit '/search'
    expect(page).to have_selector('a', text: sport.name)
  end


end
