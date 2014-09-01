# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_pref, :class => 'EmailPrefs' do
    user_id 1
    all_ratings false
    all_reviews false
    digest false
  end
end
