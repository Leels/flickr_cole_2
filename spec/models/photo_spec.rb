require 'rails_helper'

describe Photo, :model do
    context '(associations)' do
        it { should belong_to(:album) }
    end

    context '(validations)' do
        it { should validate_presence_of :url }
    end
end
