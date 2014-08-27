class CreateEmailPrefs < ActiveRecord::Migration
  def change
    create_table :email_prefs do |t|
      t.integer :user_id
      t.boolean :all_ratings
      t.boolean :all_reviews
      t.boolean :digest

      t.timestamps
    end
  end
end
