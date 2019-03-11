require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do
    before :each do
      fill_in("Username", with: "Colin")
      fill_in("Password", with: "hotsauce")
      click_button("Sign Up")
      # save_and_open_page
      # visit users_path
    end

    scenario 'shows username on the homepage after signup' do 
      expect(page).to have_content("Colin")
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end