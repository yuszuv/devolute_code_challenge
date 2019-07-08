require 'web_spec_helper'

RSpec.feature "Sign up" do

  scenario "with valid request params" do
    visit("/sign_up")

    fill_in("Username", with: 'john.doe')
    fill_in("Password", with: 'secret123')
    fill_in("Password confirmation", with: 'secret123')

    click_button("Sign Up")

    expect(page).to have_content("Success")
  end

  scenario "with invalid request params" do
    visit("/sign_up")

    fill_in("Username", with: 'john.doe')
    fill_in("Password", with: 'secret123')
    fill_in("Password confirmation", with: 'somethingelse')

    click_button("Sign Up")

    expect(page).to have_content("Error")
  end
end

