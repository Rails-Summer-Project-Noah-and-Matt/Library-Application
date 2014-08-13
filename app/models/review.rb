class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :text, :user_id, :book_id, presence: true

end
