require 'rails_helper'

feature "user logs in" do 

  before(:each) do 
      User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123"})
  end

  scenario "with valid credentials" do 
    visit login_path
    fill_in "Email", with: "JD2000"
    fill_in "Password", with: "123"
    click_button "Login"
    expect(page).to have_content("Welcome, John!")
  end

   scenario "with invalid credentials - no Email" do 
    visit login_path
    fill_in "Email", with: ""
    fill_in "Password", with: "123"
    click_button "Login"
    expect(page).to have_content("Invalid login")
  end

  scenario "with invalid credentials - no password" do 
    visit login_path
    fill_in "Email", with: "JD2000"
    fill_in "Password", with: ""
    click_button "Login"
    expect(page).to have_content("Invalid login")
  end

  scenario "with invalid credentials -with wrong password" do 
    visit login_path
    fill_in "Email", with: "JD2000"
    fill_in "Password", with: "321"
    click_button "Login"
    expect(page).to have_content("Invalid login")
  end

  scenario "with invalid credentials -with wrong Email" do 
    visit login_path
    fill_in "Email", with: "JD200"
    fill_in "Password", with: "321"
    click_button "Login"
    expect(page).to have_content("Invalid login")
  end
end

feature "user logs out" do 

  before(:each) do 
    User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123"})
  end

  scenario "after being logged in" do 
    visit login_path
    fill_in "Email", with: "JD2000"
    fill_in "Password", with: "123"
    click_button "Login"
    expect(page).to have_content("Welcome, John!")

    click_button "Logout"
    expect(page).to have_content("Successfully logged out")
  end
end