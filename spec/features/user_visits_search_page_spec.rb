require 'spec_helper'

describe 'visiting the search page' do
  it 'exists' do
    visit '/search'
    expect(page.status_code).to eq(200)
  end


end
