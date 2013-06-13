require 'spec_helper'

describe 'using the header' do
  it 'links to root page' do
    visit '/search'
    click_on 'Sport Finder'
    expect(current_path).to eq('/')
  end




end
