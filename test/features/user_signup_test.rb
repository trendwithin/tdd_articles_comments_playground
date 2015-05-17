require "test_helper"

feature "User Signup" do
  scenario "Presence of Sign Up form" do
    visit new_user_registration_path
    page.must_have_content "Sign up"
    page.wont_have_content "You Say Goodbye and I Say Hello"
  end
end

feature 'User Signs Up to Site' do
  scenario 'User Inputs Email/Password/Password confirmation' do
    visit new_user_registration_path
    fill_in 'Email', with: 'shane@theshield.net'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    page.must_have_content 'Welcome! You have signed up successfully.'
  end
end

feature 'User Inputs Malformed Data' do
  scenario 'User doesn\'t include Email' do
    visit new_user_registration_path
    fill_in 'Email', with: '     '
    click_button 'Sign up'
    page.must_have_content 'Email can\'t be blank'
  end

  scenario 'Malformed Email' do
    visit new_user_registration_path
    fill_in 'Email', with: 'me.com'
    click_button 'Sign up'
    page.must_have_content 'Email is invalid'
  end

  scenario 'Empty Password' do
    visit new_user_registration_path
    fill_in 'Email', with: 'lemansky@theshield.net'
    fill_in 'Password', with: '     '
    click_button 'Sign up'
    page.must_have_content 'Password can\'t be blank'
  end

  scenario 'Invalid Password Confirmation' do
  visit new_user_registration_path
  fill_in 'Email', with: 'lemansky@theshield.net'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password1'
  click_button 'Sign up'
  page.must_have_content 'Password confirmation doesn\'t match Password'
  end
end


