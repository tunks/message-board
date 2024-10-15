require 'rails_helper'

RSpec.describe User, type: :model do
   context "validation" do
        it "should be valid user with email and password" do
            user = build(:user)
            expect(user).to be_valid
        end

        it "should not be valid user without email and password" do
          user = build(:user_with_invalid_email)
          expect(user).not_to be_valid
      end
   end
end
