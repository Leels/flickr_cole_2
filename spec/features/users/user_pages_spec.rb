require 'rails_helper'

describe 'User\'s page', :logged_out do
    it "displays user details" do
        User.create!({username: 'CapyTest', email: 'capytest@test.com', password: 'password'})
        visit '/CapyTest'
        expect(page).to have_content 'CapyTest'
    end
end
