require 'rails_helper'

feature "user logs in" do 

  before(:each) do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_button "Create New Category"
    fill_in "category[name]", with: "Animals"
    click_button "Submit"

    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"    
  end

  scenario "and upon creating an idea, is able to select a category" do 
    click_button "Create New Idea"
    fill_in "Title", with: "My Cat Idea"
    fill_in "Description", with: "Meow"
    select('Animals', :from => 'idea[category_id]')
    click_button "Submit"
    expect(page).to have_content("My Cat Idea")
    expect(page).to have_content("Meow")
    expect(page).to have_content("Animals")
  end
end