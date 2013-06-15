require 'spec_helper'

describe 'searching for a sport' do
  let(:sport_with_courts) do
    court = FactoryGirl.build(:court)
    court.location = FactoryGirl.create(:location)
    court.sport = FactoryGirl.create(:sport)
    court.save
    @sport_with_courts = Court.last.sport
  end
  before(:each) { visit sport_courts_path(sport_with_courts) }

  it 'displays an added court' do
    expect(page).to have_content(sport_with_courts.courts[0].number_of)
  end

  it 'displays courts on sport search page' do
    expect(page).to have_content(sport_with_courts.courts[0].number_of)
  end

  it 'displays court locations' do
    location = sport_with_courts.courts.last.location
    expect(page).to have_content(location.street_address)
  end


end
