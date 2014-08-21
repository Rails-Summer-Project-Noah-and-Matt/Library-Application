class Author < ActiveRecord::Base
  validates :given_name, allow_blank: true, length: {
    minimum: 1, 
    maximum: 256,
    message: 'Given names must be between 1 and 256 characters long'
  }
  
  validates :family_name, presence: true, length: { 
    minimum: 1, 
    maximum: 256,
    message: 'Family names must be between 1 and 256 characters long'
  }
  
  has_many :books, :dependent => :restrict_with_exception

  def full_name
    first = given_name ? "#{given_name} " : ''
    "#{first}#{family_name}"
  end

  def sortable_name
    first = given_name ? ", #{given_name}" : ''
    "#{family_name}#{first}"
  end

  def destroyable?
    !books.any?
  end

end
