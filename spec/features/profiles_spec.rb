require 'rails_helper'
 
 describe "Visiting profiles" do
 
   include TestFactories
   include Warden::Test::Helpers
   
    
   before do
     
     @user = authenticated_user
     @post = associated_post(user: @user)
     @comment = Comment.new(user: @user, post: @post, body: "A Comment")
     allow(@comment).to receive(:send_favorite_emails)
     @comment.save!
   end
 
   describe "not signed in" do
 
     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))
       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
 
   end

   before do
      Warden.test_mode!
      @user2 = authenticated_user
      @post2 = associated_post(user: @user2)
      @comment2 = Comment.new(user: @user2, post: @post2, body: "A Comment")
      allow(@comment2).to receive(:send_favorite_emails)
      @comment2.save!
      login_as(@user2, :scope => :user)
      
      
    end

   describe "signed in" do
 
     it "shows profile" do
       
       visit user_path(@user2)
       expect(page).to have_content('Sign out')
       expect(current_path).to eq(user_path(@user2))
       expect( page ).to have_content(@user2.name)
       expect( page ).to have_content(@post2.title)
       expect( page ).to have_content(@comment2.body)
     end
    end
 end