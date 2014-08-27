class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :text, :user_id, :book_id, presence: true
  
  after_create :email_users


  def email_users
    LibraryMailer.update_user_review_email(self.user, self.book).deliver if self.user.email_prefs.all_reviews
  end


  self.per_page = 5  #pagination

end
