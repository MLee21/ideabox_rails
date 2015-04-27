require 'rails_helper'

feature "A user can add an image to an idea" do 

  before(:each) do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_button "Create New Category"
    fill_in "category[name]", with: "Minimalist Photos"
    click_button "Submit"

    visit admin_images_path
    click_button "Create New Image"
    fill_in "image[title]", with: "Lines"
    page.attach_file('image[attachment]', Rails.root + 'spec/images/landscape-113.jpg')
    click_button "Submit"


    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login" 
  end

  scenario "successfully" do 
    click_button "Create New Idea"
    fill_in "Title", with: "Make a light reflector"
    fill_in "Description", with: "For semi-cloudy days"
    select("Minimalist Photos", :from => 'idea[category_id]')
    find(".image:first-child").click 
    click_button "Submit"
    save_and_open_page
    expect(page).to have_content("Make a light reflector")
    expect(page).to have_content("Minimalist Photos")
    # expect(page).to have_css("img[src = ""]")
  end
end