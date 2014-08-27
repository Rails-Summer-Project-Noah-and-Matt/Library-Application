class EmailPrefsController < ApplicationController
   before_action :set_user, only: [:show]
   def update
     @email_prefs = EmailPrefs.find(params[:ie])
     @email_prefs.update(email_prefs_params)
     redirect_to email_pref_path
   end

   def show
     @email_prefs = EmailPrefs.find_or_create_by(user: current_user)
   end


   private
   def set_user
     @user = current_user
   end

   def email_prefs_params
     params[:email_prefs].permit(:user_id, :all_ratings, :all_reviews, :digest)
   end
end


 

