require 'rails_helper'

RSpec.describe User, type: :model do
	context "Has a valid factory" do 

		it "is created with valid attributes" do 
			expect(build(:user)).to be_valid
		end
	end

	context "With valid attributes" do 

		it "automatically encrypts the password_digest attribute" do 
			expect(build(:user).password_digest.present?).to eq(true)
		end

		it "email is not case sensative" do 
			expect(create(:user, email:"JON@THEWALL.COM").email).to eq("jon@thewall.com")
		end
	end

	context "Attributes are invalid if " do 

		it "first name is not present" do 
			expect(build(:user, first_name:"")).to be_invalid
		end

		it "last_name is not present" do 
			expect(build(:user, last_name:"")).to be_invalid
		end

		it "email is not present" do 
			expect(build(:user, email:"")).to be_invalid
		end

		it "password is not present" do 
			expect(build(:user, password:"")).to be_invalid
		end

		it  "email format is incorrect" do 
			emails = %w[@ user@ @example.com user.com]
			emails.each do |email|
				expect(build(:user, email: email)).to be_invalid
			end
		end

		it "email is not unique" do 
			create(:user)
			expect(build(:user, email: "fox@x-files.com")).to be_invalid
		end

		it "password confirmation doesn't match password"do 
			expect(build(:user, password:"password", password_confirmation:"notpassword")).to be_invalid
		end
	end 
end
