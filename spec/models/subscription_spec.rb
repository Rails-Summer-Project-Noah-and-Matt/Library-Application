require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  before(:example) do 
    @user = User.create(email: "ugh@test.com", name: "user", password: "password", password_confirmation: "password")
    @book1 = Book.create(title: "This is a test book", owner_id: 1)
    @book2 = Book.create(title: "This is another test book", owner_id: 2)
  end

  it "should let a user follow a book" do
    assert @user.follow!(@book1)
  end

  it "should return a subscription object if the user is following a book" do
    @user.follow!(@book1)
    assert @user.following?(@book1)
  end
   
  it "shouldn't return a subscription object if the user isn't following a book" do
    assert !@user.following?(@book2)
  end

  it "should let a user unfollow a book" do
    @user.follow!(@book1)
    assert @user.unfollow!(@book1)
    assert !@user.following?(@book2)
  end

end
