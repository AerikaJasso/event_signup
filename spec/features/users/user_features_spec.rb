require 'rails_helper'

feature "User features" do 

	before do 
		@user = create(:user)
	end

	feature "user registration" do 
		before(:each) do 
			visit "/sessions/new"
		end

		scenario "visits the welcome page" do 
			expect(page).to have_field("first_name")
			expect(page).to	have_field("last_name")
			expect(page).to	have_field("email")
			expect(page).to	have_field("city")
			expect(page).to	have_field("state")
			expect(page).to	have_field("password")
			expect(page).to	have_field("password_confirmation")
		end

		scenario "with inproper inputs, redirects back to welcome page and displays validations" do 
			click_button "Register"
			expect(current_path).to eq("/sessions/new")
			expect(page).to have_text("can't be blank")
		end

		scenario "with proper inputes, creates user and redirects to events dashboard" do 
			fill_in "first_name", with: "Damian"
			fill_in "last_name", with: "Lillard"
			fill_in "email", with: "ripcity@gmail.com"
			fill_in "city" , with: "Portland"
			select("OR", :from => "state")
			fill_in "password", with: "passtherock12"
			fill_in "password_confirmation", with: "passtherock12"
			click_button "Register"
			expect(current_path).to eq("/events")
		end
	end
end