class UsersEventsController < ApplicationController

	def create
		
		@user_event = UsersEvent.create(event_id: params[:event_id], user: current_user )
			if @user_event.save 
				redirect_to events_path, flash: {success: "You have joined the event"}
			else
				redirect_to events_path, flash: {danger: @user_event.errors.full_messages }
			end
	end

	def destroy
		UsersEvent.find(params[:id]).destroy
		redirect_to events_path, flash: { warning: "You have left the event" }
	end
end
