require 'rails_helper'
#require 'test_helper'

RSpec.describe User, :type => :model do
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
  
end


