require 'rails_helper'

feature "user logs in" do 
  
 before(:each) do 
    category = Category.create(name: "My category")
    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    ideas = user.ideas.create(title: "My Idea", description: "My description", category_id: category.id)
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  scenario "and can see their ideas" do 
    click_button "Create New Idea"
    fill_in "Title", with: "My Idea"
    fill_in "Description", with: "My description"
    select('My category', :from => 'idea[category_id]')
    click_button "Submit"
    expect(page).to have_content("My Idea")
    expect(page).to have_content("My description")
  end

  scenario "and can't see another user's ideas" do 
    user2 = User.create({first_name: "Amy", last_name: "Jones", email: "AJ10@hotmail.com", password: "321", password_confirmation: "321", role: 0})
    user2.ideas.create(title: "Make a robot", description: "Robot Maid")
    expect(page).to_not have_content("Make a robot")
    expect(page).to_not have_content("Robot Maid")
  end
end

feature "user creates an idea" do 

  before(:each) do 
    category = Category.create(name: "My category")
    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    ideas = user.ideas.create(title: "My Idea", description: "My description", category_id: category.id)
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  scenario "with valid attributes" do 
    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"

    click_button "Create New Idea"
    fill_in "Title", with: "My Idea"
    fill_in "Description", with: "My description"
    select('My category', :from => 'idea[category_id]')
    click_button "Submit"
    expect(page).to have_content("My Idea")
    expect(page).to have_content("My description")
  end

  #   scenario "with invalid attributes - no title" do 
  #   user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
  #   visit login_path
  #   fill_in "Email", with: "JD20@hotmail.com"
  #   fill_in "Password", with: "123"
  #   click_button "Login"

  #   click_button "Create New Idea"
  #   fill_in "Title", with: ""
  #   fill_in "Description", with: "My description"
  #   click_button "Submit"
  #   expect(page).to have_content("Could not be created")
  # end

  #   scenario "with invalid attributes - no description" do 
  #   user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
  #   visit login_path
  #   fill_in "Email", with: "JD20@hotmail.com"
  #   fill_in "Password", with: "123"
  #   click_button "Login"

  #   click_button "Create New Idea"
  #   fill_in "Title", with: "My Idea"
  #   fill_in "Description", with: ""
  #   click_button "Submit"
  #   expect(page).to have_content("Could not be created")
  # end
end


