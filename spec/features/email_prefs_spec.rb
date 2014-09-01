describe "Email Prefs Features" do
 
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
 
  describe 'Show' do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

   it 'does not let non-signed in users set their email prefs' do
     visit email_prefs_path @user
     expect(page).to_not have_link('Email Preferences')
   end
   
   it 'does let signed in users view their email prefs' do
     visit new_user_session_path
     fill_in 'Email',  with: @user.email
     fill_in 'Password', with: @user.password
     click_button 'Sign in'
     visit email_prefs_path @user
     expect(page).to have_text('Email Preferences')
   end

   it 'lets a signed in user update their email prefs' do 
     visit new_user_session_path
     fill_in 'Email', with: @user.email
     fill_in 'Password', with: @user.password
     click_button 'Sign in'
     visit email_prefs_path @user
     check 'email_prefs_all_ratings'
     click_button 'Update' 
     expect(page).to have_text('Email Preferences') 
    end
  end 
end
