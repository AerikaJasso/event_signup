require 'rails_helper'
feature "authentication" do 
	before do 
		@user = create(:user)
	end

	feature "user attempts to login " do
		scenario "visits sign-in page" do 
			visit "/sessions/new"
			expect(page).to have_field("login_email")
			expect(page).to have_field("login_password")
		end

		scenario "logs in user if email/password combination is valid" do 
			login
			expect(current_path).to eq("/events")
			expect(page).to have_text(@user.first_name)
		end

		scenario "does not sign user in if email is not found"  do 
			login email:"wrongemail@me.com"
			expect(current_path).to eq("/sessions/new")
			expect(page).to have_text("Invalid Credentials")
		end

		scenario "does not sign user in if password is invalid" do 
			login password: "wrongpassword"
			expect(current_path).to eq("/sessions/new")
			expect(page).to have_text("Invalid Credentials")
		end
	end
end