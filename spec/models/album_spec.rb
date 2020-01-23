require 'rails_helper'

describe Album, :model do
    context '(associations)' do
        it { should have_many(:photos) }
        it { should belong_to(:user) }
    end

    context '(validations)' do
        it { should validate_presence_of :name }
    end
end
