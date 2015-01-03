require 'rails_helper'

describe User do 
	it 'has a valid factory' do 
		expect(FactoryGirl.build(:user)).to be_valid
	end

	describe "with valid attributes do" do 

		it "is valid with a name and email" do 
			user = build(:user)
			expect(user).to be_valid
		end

		it 'is invalid without a name' do 
			user = build(:user, name: nil)
			user.valid?
			expect(user.errors[:name]).to include("can't be blank")
			#check for list of default error messages in rails guides, and NL translation!
		end

		it "is invalid without an email address" do 
			user = build(:user, email: nil)
			user.valid?
			#expect(user.errors[:email]).to include("can't be blank")
			expect(user).not_to be_valid
			#check the specific error or the validity
		end

		it "name should not be too long" do 
			long_name = "a" * 51
			user = build(:user, name: long_name)
			user.valid?
			expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
		end

		it "email should not be too long" do 
			long_email = "a" * 256
			user = build(:user, email: long_email)
			user.valid?
			expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
		end

		it "should be valid with a valid email address" do 
			valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
	                         first.last@foo.jp alice+bob@baz.cn]
	        valid_addresses.each do |valid_address|
	        	user = build(:user, email: valid_address)
	        	user.valid?
	        	expect(user).to be_valid
	        end
		end

		it "should be invalid with an invalid email address" do 
			invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
	                           foo@bar_baz.com foo@bar+baz.com]
	        invalid_addresses.each do |invalid_address|
	        	user = build(:user, email: invalid_address)
	        	user.valid?
	        	expect(user.errors[:email]).to include("is invalid")
	        end
		end

		it "email address should be unique" do 
			user_1 = create(:user, email: "test@example.com")
			user_2 = build(:user, email: "TeSt@eXampLe.com")
			#also includes test for up and downcase
			user_2.valid?
			expect(user_2.errors[:email]).to include("has already been taken")
		end

		it "password should have a minimum length" do 
			long_password = "a" * 5
			user = build(:user, password: long_password, password_confirmation: long_password)
			user.valid?
			expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
		end

		it "email address should be saved as lowercase" do 
			user = create(:user, email: "TEST@EXAMPLE.COM")
			expect(user.email).to  eq 'test@example.com'

		end
	end #end valid attributes

end