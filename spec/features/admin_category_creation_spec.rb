require 'rails_helper'

feature "An admin creates a category" do 

  scenario "successfully" do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_button "Create New Category"
    fill_in "category[name]", with: "Animals"
    click_button "Submit"
    expect(page).to have_content("'Animals' was successfully created!")
  end

  scenario "unsuccessfully - no name" do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_button "Create New Category"
    fill_in "category[name]", with: ""
    click_button "Submit"
    expect(page).to have_content("Name can't be blank")
  end
end

feature "A user will not be able to see the category index" do 

  scenario "when they are logged in" do 
    user = User.create({first_name: "Harry", last_name: "Hill", email:"harry@gmail.com", password: "123", password_confirmation: "123", role: 0})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_categories_path
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end