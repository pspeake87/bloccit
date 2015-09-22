require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do

     before do
        @user = authenticated_user
        @post = associated_post
        @post2 = associated_post
        @user.favorites.create(post: @post)
      

     end
      it "returns `nil` if the user has not favorited the post" do
        expect(@user.favorited(@post2)).to eq(nil)
     end
 
      it "returns the appropriate favorite if it exists" do
        
        expect(@user.favorited(@post)).to_not eq(nil)
     end
   end
 end