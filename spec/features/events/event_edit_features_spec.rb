require 'rails_helper'

feature "Events edit feature" do 
	before do
		@user= create(:user) 
		login
		create_event
		click_link "Edit"
	end

	scenario "current event attributes are visible in edit path" do 
		page.has_content?("Our first event")
		page.has_content?("Seattle")
		page.has_content?("WA")
		page.has_content?("06/02/2018")
		page.has_content?("08:00PM")
	end

	scenario "can update attributes in edit path" do 
		fill_in "name", with: "Edited Event"
		fill_in "date", with: "01/01/2018"
		fill_in "city", with: "Seattle"
		select("WA", :from => "state")
		fill_in "time", with: "08:00PM"
		click_button "Update Event"

		page.has_content?("Edited Event")
		page.has_content?("01/01/2018")
	end
end