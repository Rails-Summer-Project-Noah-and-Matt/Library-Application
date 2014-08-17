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
  
  has_many :books
  before_destroy :check_for_books

  def full_name
    first = given_name ? "#{given_name} " : ''
    "#{first}#{family_name}"
  end

  def sortable_name
    first = given_name ? ", #{given_name}" : ''
    "#{family_name}#{first}"
  end

  private

  def check_for_books
    if books.count > 0
      errors.add :base, "cannot delete Author while books exist"
      return false
    end
  end

end
