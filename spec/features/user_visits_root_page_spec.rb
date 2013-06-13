require 'spec_helper'

describe 'visiting the root page' do
  it 'exists' do
    visit '/'
    expect(page.status_code).to eq(200)
  end

  it 'displays app name' do
    visit '/'
    expect(page).to have_content('Sport Finder')
  end

  it 'shows list of sports site supports' do
    FactoryGirl.create(:sport, name: 'Sport1')
    FactoryGirl.create(:sport, name: 'Sport2')

    visit '/'

    expect(page).to have_content('Sport1')
    expect(page).to have_content('Sport2')
  end
end
