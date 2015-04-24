'rails_helper'

feature "user edits idea" do 

  before(:each) do 
    category = Category.create(name: "New Category")
    category2 = Category.create(name: "Newer Category")
    user = User.create({first_name: "John", last_name: "Smith", email: "JD20@hotmail.com", password: "123", password_confirmation: "123", role: 0})
    user.ideas.create(title: "My Idea", description: "My description", category_id: category.id)
    visit login_path
    fill_in "Email", with: "JD20@hotmail.com"
    fill_in "Password", with: "123"
    click_button "Login"
  end


  scenario "successfully" do 
    click_link "Edit"
    fill_in "Title", with: "Make synthesizer"
    fill_in "Description", with: "Based off of Moog"
    select('Newer Category', :from => 'idea[category_id]')
    click_button "Update"
    expect(page).to have_content("Make synthesizer")
    expect(page).to_not have_content("My Idea")
  end
end
