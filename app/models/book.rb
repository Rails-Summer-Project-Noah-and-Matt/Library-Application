class Book < ActiveRecord::Base
  validates :title, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Titles must be between 1 and 256 characters long'
  }
  
  validates :isbn10, allow_blank: true, format: { 
    with: /\A[[:digit:]]{10}\z/,
    message: 'ISBN10 is a 10 digit format'
  }

  validates :isbn13, allow_blank: true, format: { 
    with: /\A[[:digit:]]{13}\z/,
    message: 'ISBN13 is a 13 digit format'
  }

  belongs_to :owner, class_name: User
  belongs_to :author
  accepts_nested_attributes_for :author
 
  has_many :subscriptions, foreign_key: "followed_id", dependent: :destroy 
  has_many :followers, through: :subscriptions, source: :follower

  has_many :reviews

  # carrierwave 
  mount_uploader :cover, CoverUploader
end
