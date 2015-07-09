require 'rails_helper'

describe "the log in process" do

  it "will prompt you to log in before continuing onto the site" do
    visit "/"
    expect(page).to have_content "You need to sign in"
  end


  it "will log the user in" do
    visit new_user_session_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content user.email
  end

  it "will alert you of any password errors logging in" do
    visit new_user_session_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "alksjdlsjadf"
    click_button 'Log in'
    expect(page).to have_content "Invalid"
  end

  it "will alert you of any email errors logging in" do
    visit new_user_session_path
    user = FactoryGirl.create(:user)
    fill_in 'Email', with: "laskjflksjdf"
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Invalid"
  end

end
