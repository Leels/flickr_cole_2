require 'rails_helper'

describe 'the session sign-in process', :logged_out do
    it "begins session" do
        User.create!({username: 'CapyTest', email: 'capytest@test.com', password: 'password'})
        visit '/'
        click_on 'Sign in'
        fill_in 'email', :with => 'capytest@test.com'
        fill_in 'password', :with => 'password'
        page.find('#sign-in').click_on 'Sign in'
        expect(page).to have_content 'You\'ve signed in.'
    end
    it "gives error when credentials are incorrect" do
        visit '/'
        click_on 'Sign in'
        fill_in 'email', :with => 'test@test.com'
        fill_in 'password', :with => ''
        page.find('#sign-in').click_on 'Sign in'
        expect(page).to have_content 'There was a problem signing in. Please try again.'
    end
end
