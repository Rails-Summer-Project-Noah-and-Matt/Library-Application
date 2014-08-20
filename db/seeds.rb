# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new({ :email => 'admin@example.com', :password => 'password', :admin => true, :password_confirmation => 'password'}).save
User.new({ :email => 'user@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'}).save

Author.new({ :given_name => 'Douglas', :family_name => 'Adams' }).save
Author.new({ :given_name => 'J.R.R.', :family_name => 'Tolkien' }).save
Author.new({ :given_name => 'Lewis', :family_name => 'Carrol' }).save
Author.new({ :given_name => 'David', :family_name => 'Brin' }).save
Author.new({ :given_name => 'Barbara', :family_name => 'Kafka' }).save

Book.new({ :title => 'The Salmon of Doubt',
           :is_active => true,
           :owner_id => 2,
           :author_id => 1,
           :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif')) 
}).save
Book.new({ :title => 'The Hobbit',
           :is_active => true,
           :owner_id => 2,
           :author_id => 2,
           :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif')) 
}).save
Book.new({ :title => 'Alice in Wonderland',
           :is_active => true,
           :owner_id => 2,
           :author_id => 3,
           :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif')) 
}).save
Book.new({ :title => 'The Uplift War',
           :is_active => true,
           :owner_id => 2,
           :author_id => 4,
           :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif')) 
}).save
Book.new({ :title => 'The Opinionated Palate',
           :is_active => true,
           :owner_id => 2,
           :author_id => 5,
           :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif')) 
}).save

taglist = ['science fiction', 'food', 'funny', 'fantasy', 'chimpanzees']
taglist.each do |tag|
    ActsAsTaggableOn::Tag.new(:name => tag).save
end
