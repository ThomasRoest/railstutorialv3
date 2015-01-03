require 'rails_helper'

feature 'static pages' do 
	scenario 'navigate static pages' do 
		visit root_path
		expect(page).to have_link "Sign up now!"
		click_link 'Contact'
		expect(page).to have_content('Contact')
		click_link 'About'
		expect(page).to have_content('About')
		expect(page).to have_title('About')
	end
end