require 'rails_helper'

feature 'Events show feature' do 
	before do 
		@user = create(:user)
		login
		create_event
		@event = Event.find_by(name: "Our first event")
		click_link "Our first event"
	end

	scenario "upon clicking an event name, redirects you to event show page" do 
		expect(page).to have_current_path(event_path(@event))
	end

	scenario "events show page displays event details" do 
		expect(page).to have_content("Our first event")
		expect(page).to have_content("Seattle")
		expect(page).to have_content("WA")
		expect(page).to have_content("February 6th, 2018")
		expect(page).to have_content("Fox")
	end

	scenario "displays users who are attending the event" do 
		expect(page).to have_text("Name")
		expect(page).to have_text("Attendees")
		expect(page).to have_content(0)
	end

	scenario "event page has a discussion field" do 
		expect(page).to have_field("message")
	end

	scenario "comments are saved and displayed" do 
		fill_in "message", with:"This event will rock!"
		click_button "Submit Comment"

		expect(page).to have_text("This event will rock!")
	end
end