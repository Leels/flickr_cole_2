require 'rails_helper'

describe 'the session sign-out process' do
    it "ends session" do
        click_on 'Sign out'
        expect(page).to have_content 'You\'ve signed out.'
    end
end
