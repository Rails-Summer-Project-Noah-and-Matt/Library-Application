FactoryGirl.define do
 factory :user do
   sequence(:email) { |n| "test#{n}@user.com" }
   password "password"
   password_confirmation { "password" }
 end

 factory :admin, class: User  do
   email "admin@user.com"
   password "password"
   password_confirmation { "password" }
   admin true
 end

 factory :book do
   association :owner_id, factory: :user
   title "This is a test book"
   is_active true
 end

 factory :review do 
   association :user_id, factory: :user
   association :book_id, factory: :book
   text "This is a good review!"
 end

end
