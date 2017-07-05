require 'rails_helper'

feature "Users Event features" do 
	before do 
		@user = create(:user)
		login
		create_event
	end

	feature "Event creating features" do 
		
		scenario "displays links to 'Edit' and 'Delete' for a created event" do 
			expect(page).to have_link("Edit")
			expect(page).to have_link("Delete")
		end

		scenario "Edit link redirects to edit event page" do 
			click_link "Edit"
			expect(page).to have_text("Edit Your Event")
		end

		scenario "Delete link deletes users event" do 
			click_link "Delete"
			expect(page).to have_text("You Have Deleted the Event")
		end
	end

	feature "Event joining features" do 
		before do 
			@user2 = create(:user, first_name: "Dana",
						    last_name: "Scully",
						    email: "scully@x-files.com",
						    city: "Los Angeles",
						    state: "CA",
						    password: "password")
			login email: "scully@x-files.com", password: "password"
		end

		scenario "displays link to 'Join' an event" do 
			expect(page).to have_link("Join")
		end

		scenario "displays link to 'Cancel' and removes event" do
			click_link "Join"
			expect(page).to have_text("Joined") 
			expect(page).to have_link("Cancel")
			click_link "Cancel"
			expect(page).to have_link("Join")
		end
	end
end

