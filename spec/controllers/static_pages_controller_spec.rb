require 'rails_helper'

describe StaticPagesController do 

	describe "staticpages" do 

		describe 'Get #help' do 
			it "renders the help page" do 
				get :help
				expect(response).to render_template :help
			end
		end

		describe "Get #contact" do 
			it "renders the contact page" do 
				get :contact
				expect(response).to render_template :contact
			end
		end

	end #end staticpages
end #end StaticPagesController