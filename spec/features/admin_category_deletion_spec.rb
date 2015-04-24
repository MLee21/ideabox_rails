require 'rails_helper'

feature "An admin deletes a category" do 

  scenario "successfully" do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category1 = Category.create(name: "Grindcore")
    visit admin_categories_path
    click_link "Delete"
    visit admin_categories_path
    expect(page).to_not have_content("Grindcore")
  end

  scenario "successfully in a list of categories" do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category1 = Category.create(name: "Animals")
    category2 = Category.create(name: "Grindcore")
    category3 = Category.create(name: "Healthcare")

    visit admin_categories_path
    within first(".delete") do
      click_link "Delete"
    end
    visit admin_categories_path
    expect(page).to_not have_content("Animals")
    expect(page).to have_content("Grindcore")
    expect(page).to have_content("Healthcare")
  end
end