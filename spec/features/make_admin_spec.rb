require 'rails_helper'

describe 'User Administration Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'as an admin' do

    before(:each) do
      @user  = FactoryGirl.create(:user)
      @admin = FactoryGirl.create(:admin)
      visit new_user_session_path
      fill_in 'Email', with: @admin.email
      fill_in 'Password', with: @admin.password
      click_button 'Sign in'
    end
    
    it 'I can make another user an admin' do
      visit useradmin_path @user
      click_link 'Make Admin'
      expect(page).to have_text("#{@user.email} true", count: 1)
    end

  end

end
