require 'spec_helper'

describe 'visiting the search page' do
  let!(:sport) { FactoryGirl.create(:sport) }
  before(:each) { visit sports_path }

  it 'exists' do
    expect(page.status_code).to eq(200)
  end

  it 'shows list of sports to search by' do
    expect(page).to have_content(sport.name)
  end

  it 'has a link for each sport' do
    expect(page).to have_selector('a', text: sport.name)
  end

  it 'links to the sports search page' do
    click_on sport.name
    expect(current_path).to eq(sport_path(sport))
  end


end
