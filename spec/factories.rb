FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@user.com" }
    password "password"
    password_confirmation { "password" }
    blocked false
   end

  factory :email_prefs do
    association :user, factory: :user
    all_reviews true
    all_ratings true
    digest true
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
    association :owner, factory: :user
    association :author_id, factory: :author
    sequence(:title) { |n| "The #{n}House at Pooh Corner" }
    cover { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'covers', 'cover.gif')) }
    is_active true
    after(:build) { |book| book.true_user_id = book.owner.id }
  end 

  factory :review do 
    association :user_id, factory: :user
    association :book_id, factory: :book
    text 'This is a great review' 
    rating 3
    after(:build) { |review| review.true_user_id = review.user_id }
  end

end
