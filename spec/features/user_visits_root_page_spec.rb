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
end
