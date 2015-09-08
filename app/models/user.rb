class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts

  def admin?
   role == 'admin'
  end
 
 def moderator?
   role == 'moderator'
 end

 def member?
   role == 'member'
 end

 def guest?
   role == 'guest'
 end

 

end
