
require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
        it 'is valid with valid attributes' do
            user = build(:user)
            expect(user).to be_valid
        end
        
        it 'is not valid without an email' do
            user = build(:user,email: nil)
            expect(user).not_to be_valid
        end

        it 'is not valid without a password' do
            user = build(:user, password: nil)
            expect(user).not_to be_valid
        end
    end



end