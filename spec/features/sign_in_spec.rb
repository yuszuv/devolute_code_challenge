require 'web_spec_helper'

RSpec.feature "Sign in" do

  background do
    encrypted_password = Authentication::EncryptPassword.new.('secret123')

    Factory[:user, username: 'john.doe', encrypted_password: encrypted_password]
  end

  scenario "with valid request params" do
    visit("/sign_in")

    fill_in("Username", with: 'john.doe')
    fill_in("Password", with: 'secret123')

    click_button("Sign In")

    expect(page).to have_content("Success")
  end

  scenario "with invalid request params" do
    visit("/sign_in")

    fill_in("Username", with: 'john.doe')
    fill_in("Password", with: 'password123')

    click_button("Sign In")

    expect(page).to have_content("Error")
  end
end

