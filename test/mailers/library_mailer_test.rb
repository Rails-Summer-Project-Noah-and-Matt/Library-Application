require 'test_helper'

class LibraryMailerTest < ActionMailer::TestCase

  test "update_user_rating_email" do

    email = LibraryMailer.update_user_rating_email("test", "email").deliver
    assert_not ActionMailer::Base.deliveries.empty?
  end

end
