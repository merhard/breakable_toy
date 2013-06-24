require 'spec_helper'

describe Court do
  it 'requires a number of courts' do
    court = Court.new(location_id: 1, sport_id: 1)
    created_court = court.save
    expect(created_court).to be false
  end

  it 'requires a sport' do
    court = Court.new(location_id: 1, number_of: 1)
    created_court = court.save
    expect(created_court).to be false
  end

  it 'requires a location' do
    court = Court.new(number_of: 1, sport_id: 1)
    created_court = court.save
    expect(created_court).to be false
  end

  it 'creates a court' do
    court = Court.new(number_of: 1, location_id: 1, sport_id: 1)
    created_court = court.save
    expect(created_court).to be true
  end
end
