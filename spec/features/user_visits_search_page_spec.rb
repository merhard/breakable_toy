require 'spec_helper'

describe 'visiting the search page' do
  it 'exists' do
    visit '/search'
    expect(page.status_code).to eq(200)
  end

  it 'shows list of sports to search by' do
    sport = FactoryGirl.create(:sport)

    visit '/search'

    expect(page).to have_content(sport.name)
  end


end
