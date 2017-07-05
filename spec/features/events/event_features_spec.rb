require 'rails_helper'

feature "event features" do
	before do 
		@user = create(:user)
		login
	end

	scenario "events index page" do 
		expect(page).to have_field("name")
		expect(page).to have_field("city")
		expect(page).to have_field("state")
		expect(page).to have_field("date")
		expect(page).to have_field("time")
	end

	scenario "event is saved with correct information" do 
		fill_in "name", with: "Our first event"
		fill_in "date", with: "06/02/2018"
		fill_in "city", with: "Seattle"
		select("WA", :from => "state")
		fill_in "time", with: "08:00 PM"
		click_button "Add Event"
		expect(current_path).to eq("/events")
		expect(page).to have_text("Our first event")
	end

	scenario "event is not saved when entering a past date" do 
		fill_in "name", with: "Our first event"
		fill_in "date", with: "06/02/2015"
		fill_in "city", with: "Seattle"
		select("WA", :from => "state")
		fill_in "time", with: "08:00 PM"
		click_button "Add Event"
		expect(current_path).to eq("/events")
		expect(page).to have_text("Date can't be in the past")
	end
end