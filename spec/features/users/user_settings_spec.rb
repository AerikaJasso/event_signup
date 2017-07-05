require 'rails_helper'

feature "user features" do 
	before do 
		@user = create(:user)
		login
	end

	feature "user settings dashboard" do 
		before(:each) do 
			visit "/users/#{@user.id}/edit"
		end

		scenario "visit the users edit page" do
			expect(page).to have_field("first_name")
			expect(page).to have_field("last_name")
			expect(page).to have_field("email")
			expect(page).to have_field("city")
			expect(page).to have_field("state")
		end

		scenario "inputs are filled out correctly" do 
			expect(find_field('first_name').value).to eq(@user.first_name)
			expect(find_field('last_name').value).to eq(@user.last_name)
			expect(find_field('email').value).to eq(@user.email)
			expect(find_field('city').value).to eq(@user.city)
		end

		scenario "updates correct information" do 
			fill_in "first_name", with:"Bill"
			fill_in "last_name", with:"Murray"
			fill_in "email", with:"gocubs@gmail.com"
			fill_in "city", with:"Los Angeles"
			select("CA", :from => "state")
			click_button "Update"
			expect(find_field("first_name").value).to eq("Bill")
			expect(find_field("last_name").value).to eq("Murray")
		end

		scenario "will not update wih inproper inputs" do 
			fill_in "first_name", with: ""
			fill_in "email", with:"incorrectemail.com"
			click_button "Update"
			expect(current_path).to eq("/users/#{@user.id}/edit")
			expect(page).to have_text("Email is invalid")
		end

		scenario "logout button successfully logs out user and redirects to the login page" do 
			click_link "Logout"
			expect(current_path).to eq("/sessions/new")
			expect(page).to have_text("Welcome")
		end
	end
end