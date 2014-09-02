require 'rails_helper'

describe 'Report Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end


  describe 'Index' do
    before(:each) do
      @user   = FactoryGirl.create(:user)
      @admin  = FactoryGirl.create(:admin)
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      first(:link, "Logout").click

      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      first(:link, "Logout").click

      visit new_user_session_path
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      first(:link, "Logout").click
    end

    describe 'as a user' do
      it "can't be seen" do
        visit reports_path
        expect(page).to have_text 'Naughty!'
      end
    end

    describe 'as an admin' do

      before(:each) do
        visit new_user_session_path
        fill_in 'Email',    with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button 'Sign in'
      end

      describe 'before an impersonation' do
        it 'shows the most logged in user' do
          visit reports_path
          expect(page).to have_text("#{@user.email} 3")
        end
      end

      describe 'after an impersonation' do
        it 'still has not changed the most logged in user' do
          visit useradmin_path @user
          click_link 'Impersonate Me!'
          click_link "Stop impersonating"

          visit reports_path
          expect(page).to have_text("#{@user.email} 3")
        end
      end

    end

  end

end
