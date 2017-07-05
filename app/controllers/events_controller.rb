class EventsController < ApplicationController
  def index
    @users = User.all
    @events = Event.all 
  end

  def new
  end

  def create
    @user = current_user
    @event = @user.events.new(event_params)
    if @event.save
      redirect_to events_path, flash: { success: "Your Event Has Been Added!"}
    else 
      redirect_to events_path, flash: { danger: @event.errors.full_messages }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to edit_event_path, flash: {success: "Successfully Updated!"}
    else 
      redirect_to edit_event_path, flash: {danger: @event.errors.full_messages}
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path, flash: { warning: "You Have Deleted the Event"}
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :city, :state, :time)
  end

end
