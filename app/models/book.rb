class Book < ActiveRecord::Base
  validates :title, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Titles must be between 1 and 256 characters long' }
  belongs_to :owner, class_name: User


end
