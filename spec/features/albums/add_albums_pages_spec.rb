require 'rails_helper'

describe "the add an album process" do
    it "adds a new album" do
        visit '/'
        click_link 'New Album'
        fill_in 'album[name]', :with => 'TestAlbum'
        fill_in 'album[description]', :with => 'This is an album.'
        click_on 'Create Album'
        expect(page).to have_content 'TestAlbum'
    end
end
