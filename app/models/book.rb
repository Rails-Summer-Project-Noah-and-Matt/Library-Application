class Book < ActiveRecord::Base
  validates :title, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Titles must be between 1 and 256 characters long' }
  
  belongs_to :owner, class_name: User
 
  has_many :subscriptions, foreign_key: "followed_id", dependent: :destroy 
  has_many :followers, through: :subscriptions, source: :follower

  has_many :reviews
end
