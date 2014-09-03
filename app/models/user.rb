class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, :foreign_key => "owner_id"
  has_many :subscriptions, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_books, :through => :subscriptions, source: :followed
  has_many :reviews, dependent: :destroy

  has_one :email_prefs
  after_create :create_email_prefs

  def following?(book)
    return 'True' if subscriptions.find_by(followed_id: book.id) 
  end

  def follow!(book)
    subscriptions.create!(followed_id: book.id)
  end

  def unfollow!(book)
    subscriptions.find_by(followed_id: book.id).destroy
  end

  def toggle_blocked!
    self.blocked = (not self.blocked)
    self.save
  end

  def adminify!
    self.admin = true
    self.save
  end

end
