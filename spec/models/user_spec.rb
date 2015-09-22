require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do

     before do
        @user = authenticated_user(email_favorites: true)
        @user2 = authenticated_user(email_favorites: nil)
     end
      it "returns `nil` if the user has not favorited the post" do
        expect(@user2.email_favorites).to eq(nil)
     end
 
      it "returns the appropriate favorite if it exists" do
        
     end
   end
 end