require 'rails_helper'
feature "User can logout" do 
	before do 
		login
	end

	scenario "displays 'Logout' button when a user is logged in" do 
		expect(page).to have_button("Log Out")
	end
end