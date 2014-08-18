require 'rails_helper'

RSpec.describe "reviews/show", :type => :view do
  before(:each) do
    User.destroy_all
    Book.destroy_all
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
    @review = assign(:review, Review.create!(
    text: 'This is the review',
    user_id: @user.id,
    book_id: @book.id
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
