require 'spec_helper'

describe 'user signs up', %q{
  As a user
  I want to sign up
  so that I can begin using the site to find partners.
  } do

  # Acceptance Criteria:
  # - must provide email
  # - must provide password
  # - must match password confirmation with password
  # - must provide valid credentials

  let(:user) { FactoryGirl.build(:user) }


  it 'allows a user to sign up' do
    visit new_user_registration_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'requires valid credentials' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  it 'requires password and password confirmation to match' do
    visit new_user_registration_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'

    expect(page).to have_content("Password doesn't match confirmation")
  end


end
