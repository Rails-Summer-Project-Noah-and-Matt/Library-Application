class AddDefaultsToEmailPrefs < ActiveRecord::Migration
  def up
    change_column :email_prefs, :all_ratings, :boolean, default: false
    change_column :email_prefs, :all_reviews, :boolean, default: false
    change_column :email_prefs, :digest, :boolean, default: false
  end
 
  def down
    change_column :email_prefs, :all_ratings, :boolean, default: nil
    change_column :email_prefs, :all_reviews, :boolean, default: nil
    change_column :email_prefs, :digest, :boolean, default: nil 
  end

end
