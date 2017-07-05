require "rails_helper"

module CapybaraHelpers
	
	def login email: "fox@x-files.com", password: "password"
	  visit "/sessions/new" unless current_path == "/sessions/new"
	  fill_in "login_email", with: email
	  fill_in "login_password", with: password
	  click_button "Login"
	end

	def create_event
		fill_in "name", with: "Our first event"
		fill_in "date", with: "06/02/2018"
		fill_in "city", with: "Seattle"
		select("WA", :from => "state")
		fill_in "time", with: "08:00PM"
		click_button "Add Event"
	end
end