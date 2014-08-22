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

 factory :author do
   sequence(:given_name) { |n| "A. A. #{n}" }
   family_name 'Milnes'
 end

 factory :book do
   association :owner_id, factory: :user
   association :author_id, factory: :author
   sequence(:title) { |n| "The #{n}House at Pooh Corner" }
   cover { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'covers', 'cover.gif')) }
   is_active true
 end

 factory :review do 
   association :user_id, factory: :user
   association :book_id, factory: :book
   text "This is a good review!"
 end

end
