require 'rails_helper'

describe "sign up process" do
  it "signs a new user up" do
    visit "/"
    click_button 'Sign up'
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Password', :with => 'test123'
    fill_in 'Password confirmation', :with => 'test123'
    click 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "shows flashes and alert when the form is not filled out" do
    visit "/"
    click 'Sign up'
    expect(page).to have_content "errors prohibited this user from being saved"
  end
end
