require 'rails_helper'

feature "user deletes an idea" do 

  before(:each) do 
    category = Category.create(name: "New Category")
    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    user.ideas.create(title: "Create a robot", description: "Robot hand", category_id: category.id)
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  scenario "successfully" do 
    within ".delete" do
      click_link("Delete", :match => :first)
    end
    expect(page).to_not have_content("Create a robot")
  end
end