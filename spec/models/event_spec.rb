require 'rails_helper'

RSpec.describe Event, type: :model do
	before do 
		@user = create(:user)
	end

 	context "Has a valid factory" do 
		it 'is created with valid attributes' do 
			expect(build(:event, user: @user)).to be_valid
		end
	end

  context "Attributes are invalid if " do 
  	it "event name is not present " do 
  		expect(build(:event, name:"", user: @user)).to be_invalid
  	end

  	it "event name is less than 6 characters" do 
  		expect(build(:event, name: "event", user: @user)).to be_invalid
  	end

  	it "city is not present" do 
  		expect(build(:event, city: "", user: @user)).to be_invalid
  	end

  	it "state is not present" do 
  		expect(build(:event, state: "", user: @user)).to be_invalid
  	end
  end

  context "event relationships" do 
  	before(:each) do 
	  		@event = create(:event, user: @user)
	  end
	  
	  it "belongs to a user" do 
	  	expect(@event.user).to eq(@user)
	  end
	end
end

