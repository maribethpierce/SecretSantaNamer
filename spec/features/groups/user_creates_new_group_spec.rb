require 'rails_helper'

feature 'user can create a new group', %{
  As a user
  I want to create a new group
  So that I can exchange gifts with members of said group

  Acceptance Criteria
  [√] User can create a new group from from index
  [√] User can view form properly
  [] User gets confirmation if group is entered correctly
  [] User gets errors if form is filled out incorrectly
  [] User gets redirected to index of their groups
  [] User can navigate to their groups from from index

} do

  feature "User can create groups" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "User can navigate to new group form from index" do
      visit root_path
      click_button "Create a new group!"

      expect(page).to have_content("Create a Group!")
    end

    scenario "User can navigate to new group form from index" do
      visit root_path
      click_button "See my groups"
      expect(page).to have_content("These are all of my groups!")
    end

    scenario "Form fields are visible" do
      visit new_group_path

      find_field("Group Name")
      find_field("Description")
    end

      scenario "User gets confirmation that group was added" do
        visit new_group_path

        fill_in "Group Name", with: "This is a new group"
        click_button "Create this Group!"
        expect(page).to have_content("Group added!")
      end

      scenario "User is taken to their groups page" do
        visit new_group_path

        fill_in "Group Name", with: "This is a new group"
        click_button "Create this Group!"

        expect(page).to have_content("This is a new group")
        expect(current_path).to eq(groups_path)
      end

      scenario "User sees error messages" do
        visit new_group_path
        click_button "Create this Group!"
        expect(page).to have_content("Group name can't be blank")
      end

      scenario "User stays on form page" do
        visit new_group_path
        click_button "Create this Group!"
        find_field("Group Name")
    end
  end
end
