require 'rails_helper'

feature "An admin creates an image" do 

  before(:each) do 
    admin = User.create({first_name: "John", last_name: "Smith", email: "JD2000", password: "123", password_confirmation: "123", role: 1})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_images_path
  end

  scenario "successfully" do 
    click_button "Create New Image"
    fill_in "image[title]", with: "New Image"
    page.attach_file('image[avatar]', Rails.root + 'spec/images/landscape-113.jpg')
    click_button "Submit"
    expect(page).to have_content("Image was successfully uploaded")
  end
end