require 'rails_helper'

feature "An admin can delete an image" do 

  before(:each) do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_images_path
    click_button "Create New Image"
    fill_in "image[title]", with: "New Image"
    page.attach_file('image[attachment]', Rails.root + 'spec/images/landscape-113.jpg')
    click_button "Submit"
  end

  scenario "successfully" do 
    visit admin_images_path
    click_button "Delete"
    expect(page).to_not have_content("New Image")
  end
end