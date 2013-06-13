require 'spec_helper'

describe 'visiting the search page' do
  it 'exists' do
    visit '/search'
    expect(page.status_code).to eq(200)
  end

  it 'shows list of sports to search by' do
    FactoryGirl.create(:sport, name: 'Sport1')
    FactoryGirl.create(:sport, name: 'Sport2')

    visit '/search'

    expect(page).to have_content('Sport1')
    expect(page).to have_content('Sport2')
  end


end
