require 'spec_helper'

describe 'visiting the root page' do
  it 'exists' do
    visit '/'
    expect(page.status_code).to eq(200)
  end
end
