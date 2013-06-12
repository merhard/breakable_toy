require 'spec_helper'

describe Sport do
  it 'requires a sport name' do
    Sport.create(name: 'Tennis')
    Sport.create()
    expect(Sport.last.name).to eq('Tennis')
  end
end
