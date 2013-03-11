require 'spec_helper'


describe "StaticPages" do
	subject {page}

	describe "Home page" do
		before{visit root_path}

		it {should have_selector('h1', text:'Sample App')}
		it {should_not have_selector('title', text:'| Home')}
		it {should have_selector('title', text: full_title(''))}
	end

	describe "Help page" do
		before {visit help_path}

		it {should have_selector('h1', text: 'Help')}
		it {should have_selector('title', text: full_title('Help'))}
	end

	describe "About page" do
		before {visit about_path}

		it {should have_selector('h1', text: 'About Us')}
		it {should have_selector('title', text: full_title('About Us'))}
	end

	describe "Contact page" do
		before {visit contact_path}

		it {should have_selector('h1', text: 'Contact Us')}
		it {should have_selector('title', text: full_title('Contact Us'))}
	end
	describe "Check for working links" do
		it "should have the right links on the layout" do
			visit root_path
			click_link "About"
			should have_selector('title', text: full_title('About Us'))
			click_link "Help"
			should have_selector('title', text: full_title('Help'))
			click_link "Contact"
			should have_selector('title', text: full_title('Contact Us'))
			click_link "Home"
			should have_selector('title', text: full_title(''))
			click_link "Sign up now!"
			should have_selector('title', text: full_title('Sign Up'))
			click_link "sample app"
			should have_selector('title', text: full_title(''))
		end
	end
end
