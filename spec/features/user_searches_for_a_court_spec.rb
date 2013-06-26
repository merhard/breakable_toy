require 'spec_helper'

describe 'searching for a court', %q{
  As a user
  I want to search for the sport facilities and courts near my area
  so that I can find a place to play.
  } do

  # Acceptance Criteria:
  # - can navigate to search page
  # - search page lists max ten results
  # - can search by sport name
  # - can search by location
  # - can only see courts matching search criteria


  let!(:court1) { FactoryGirl.create(:court) }
  let!(:court2) { FactoryGirl.create(:court) }


  it 'searches by location city' do
    visit search_path
    fill_in "q_location_city_start", with: court1.location.city
    click_button 'Search'

    expect(page).to have_content(court1.location.street_address)
    expect(page).to_not have_content(court2.location.street_address)
  end

  it 'searches by sport name' do
    visit search_path
    select court1.sport.name, from: "q_sport_id_eq"
    click_button 'Search'

    expect(page).to have_selector('table.search-results', text: court1.sport.name)
    expect(page).to_not have_selector('table.search-results', text: court2.sport.name)
  end

end
