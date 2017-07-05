require 'rails_helper'

RSpec.describe UsersEvent, type: :model do
  describe "relationships" do 
  	before do 
  		@user = build(:user)
  		@event = build(:event, user: @user)
  		@users_event = build(:users_event, user: @user, event: @event)
  	end

  	it 'belongs to user' do 
  		expect(@users_event.user).to eq(@user)
  	end

  	it 'belongs to an event' do 
  		expect(@users_event.event).to eq(@event)
  	end
	end
end
