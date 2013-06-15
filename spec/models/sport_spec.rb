require 'spec_helper'

describe Sport do
  it 'requires a sport name' do
    sport = Sport.new
    created_sport = sport.save
    expect(created_sport).to be false
  end

  it 'creates a sport' do
    sport = Sport.new(name: 'Tennis')
    created_sport = sport.save
    expect(created_sport).to be true
  end
end
