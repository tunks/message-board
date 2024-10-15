require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Validate post" do
     it "is not success with missing attributes" do
        post = build(:post)
        expect(post).not_to be_valid
     end

     it "is a post with required attributes" do
      post = build(:post_with_user)
      expect(post).to be_valid
     end
   end


   describe "Save post" do
      it "does not create post with missing attributes and does not change count" do
         # expect { create(:post) }.not_to change { Post.count }
         expect { create(:post) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "create post with valid attributes and increase count by 1" do
          expect { create(:post_with_user) }.to change { Post.count }.by(1)
      end
   end
end
