class Book < ActiveRecord::Base
  validates :title, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Titles must be between 1 and 256 characters long'
  }
  
  validates :isbn10, length: { 
    is: 10,
    message: 'ISBN10 is a 10 digit format'
  }
  
  validates :isbn13, length: { 
    is: 13,
    message: 'ISBN13 is a 13 digit format'
  }

  belongs_to :owner, class_name: User
 
  has_many :subscriptions, foreign_key: "followed_id", dependent: :destroy 
  has_many :followers, through: :subscriptions, source: :follower
  
end
