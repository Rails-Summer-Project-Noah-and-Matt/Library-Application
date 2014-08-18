require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    User.destroy_all
    Book.destroy_all
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
    assign(:review, Review.new(
    text: 'This is a new review',
    user_id: @user.id,
    book_id: @book.id
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", book_reviews_path(@book.id), "post" do
    end
  end
end
