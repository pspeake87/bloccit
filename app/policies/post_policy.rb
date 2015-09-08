class PostPolicy < ApplicationPolicy

  
  def index?
   
    true
  end

class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
    
      if user == nil
        return Post.all
      else
      if user.admin? || user.moderator?
        Post.all
      else user.member?
        user.posts 
      end
    end
    
        
      end
      

    
      
    
  end

  

  
 end