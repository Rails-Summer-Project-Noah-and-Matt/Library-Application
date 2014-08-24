require 'rails_helper'

RSpec.describe User, :type => :model do



  before(:all) do
  User.destroy_all
  Book.destroy_all
  @user = FactoryGirl.create(:user)
  @book = FactoryGirl.create(:book)
  @book2 = FactoryGirl.create(:book)
  end


  it  "should create a user" do
    user = User.new
    user.email = "testuser@email.com"
    user.password = "password"
    assert user.save
  end
  
  it "should create an admin user" do
    user = User.new
    user.email = "admin@email.com"
    user.password = "password"
    user.admin = true
    assert user.save
  end

  it "should be able to follow a book" do
     assert @user.follow!(@book)
  end


  it "should be able to unfollow a book" do
     @user.follow!(@book)
     assert @user.unfollow!(@book)
     assert !@user.following?(@book)
  end

  it "should be able to check if a user is following a book" do
     assert !@user.following?(@book2)
  end



end


