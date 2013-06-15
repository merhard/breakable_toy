require 'spec_helper'

describe Location do
  let(:location) { FactoryGirl.build(:location) }

  it 'requires a city' do
    location.city = nil
    created_location = location.save
    expect(created_location).to be false
  end

  it 'requires a state' do
    location.state = nil
    created_location = location.save
    expect(created_location).to be false
  end

  it 'requires a zip' do
    location.zip = nil
    created_location = location.save
    expect(created_location).to be false
  end

  it 'requires a street address' do
    location.street_address = nil
    created_location = location.save
    expect(created_location).to be false
  end

  it 'creates a location' do
    created_location = location.save
    expect(created_location).to be true
  end
end
