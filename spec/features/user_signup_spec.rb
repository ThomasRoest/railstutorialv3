require 'rails_helper'

describe "Sign up" do 
	scenario "With invalid attributes" do 
		visit root_path

		expect {
			click_link "Sign up now!"
			fill_in "Email", with: "@bullshit"
			fill_in "Password", with: "12345"
			fill_in "Confirmation", with: "whatever"
			click_button "Create my account"
		}.not_to change(User, :count)
		expect(page).to have_content('Sign up')
	end

	scenario "With valid attributes" do 
		visit root_path
		expect{
			click_link "Sign up now!"
			fill_in "Name", with: "Example User"
			fill_in "Email", with: "example@railstutorial.org"
			fill_in "Password", with: "foobar"
			fill_in "Confirmation", with: "foobar"
			click_button "Create my account"
		}.to change(User, :count).by(1)
		
		within '.alert' do 
			expect(page).to have_content 'Welcome'
		end

	end
end