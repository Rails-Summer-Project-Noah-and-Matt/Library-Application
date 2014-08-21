class Book < ActiveRecord::Base
  acts_as_taggable_on :tags

  before_validation :clean_isbn
  before_validation :squash_whitespace

  validates :title, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Titles must be between 1 and 256 characters long'
  }
  
  validates :isbn10, allow_blank: true, format: { 
    with: /\A[[:digit:]Xx]{10}\z/,
    message: 'ISBN10 is a 10 digit format'
  }

  validates :isbn13, allow_blank: true, format: { 
    with: /\A[[:digit:]Xx]{13}\z/,
    message: 'ISBN13 is a 13 digit format'
  }

  ##FIXME this breaks everything.
  ##Matt, could you convert the book tests to FactoryGirl and make this work?
  #validates :cover, presence: true

  belongs_to :owner, class_name: User
  belongs_to :author
  accepts_nested_attributes_for :author
 
  has_many :subscriptions, foreign_key: "followed_id", dependent: :destroy 
  has_many :followers, through: :subscriptions, source: :follower

  has_many :reviews, dependent: :destroy

  mount_uploader :cover, CoverUploader

  def destroyable?
    !reviews.any?
  end

  private

  def clean_isbn
    ##FIXME this is what I *want* to do:
    #[:isbn10, :isbn13].each do |isbn|
    #  preprocess isbn { |i| i.gsub(/[- ]/, '') }
    #  preprocess isbn { |i| i.gsub(/x/, 'X') }
    #end

    self.isbn10 = self.isbn10.gsub(/[- ]/, '') if attribute_present?("isbn10")
    self.isbn10 = self.isbn10.gsub(/x/, 'X')   if attribute_present?("isbn10")
    self.isbn13 = self.isbn13.gsub(/[- ]/, '') if attribute_present?("isbn13")
    self.isbn13 = self.isbn13.gsub(/x/, 'X')   if attribute_present?("isbn13")
  end

  def squash_whitespace
    self.title = self.title.gsub(/  +/, ' ') if attribute_present?("title")
  end

  ##FIXME a first attempt at refactoring the above two
  #def preprocess param
  #  @attribute = param.to_s
  #  @param = eval "self.#{param}"
  #  @param = yield @param if attribute_present?(@attribute)
  #end

    


end
