require 'rails_helper'

feature "user creates account" do 
  scenario "successfully" do 
    visit new_user_path
    fill_in "First name", with: "Hortencia"
    fill_in "Last name", with: "Morales"
    fill_in "Email", with: "Hotbabe@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Welcome, Hortencia!")
  end

  scenario "unsuccessfully - no first name" do 
    visit new_user_path
    fill_in "First name", with: ""
    fill_in "Last name", with: "Morales"
    fill_in "Email", with: "Hotbabe@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("First name can't be blank")
  end

  scenario "unsuccessfully - no last name" do 
    visit new_user_path
    fill_in "First name", with: "Hortencia"
    fill_in "Last name", with: ""
    fill_in "Email", with: "Hotbabe@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Last name can't be blank")
  end

  scenario "unsuccessfully - no email" do 
    visit new_user_path
    fill_in "First name", with: "Hortencia"
    fill_in "Last name", with: "Morales"
    fill_in "Email", with: ""
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "unsuccessfully - no password" do 
    visit new_user_path
    fill_in "First name", with: "Hortencia"
    fill_in "Last name", with: "Morales"
    fill_in "Email", with: "Hotbabe@gmail.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"
    expect(page).to have_content("Password can't be blank")
  end

  scenario "unsuccessfully - password confirmation wrong" do 
    visit new_user_path
    fill_in "First name", with: "Hortencia"
    fill_in "Last name", with: "Morales"
    fill_in "Email", with: "Hotbabe@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "1234"
    click_button "Create Account"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
