class Topic < ActiveRecord::Base
  
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  scope :publicly_viewable, -> { all.where(public: true) }
      
  scope :privately_viewable, -> { all.where(public: false) }
      
  
    


end
