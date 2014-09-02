# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_tags_to_books book, tags
  book.tag_list = tags
  book.save
end

users = User.create([{ :email => 'admin@example.com', :password => 'password', :admin => true, :password_confirmation => 'password'},
                     { :email => 'user@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user1@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user2@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user3@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user4@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user5@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user6@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user7@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user8@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user9@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'},
                     { :email => 'user10@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'}
                   ])

authors = Author.create([{ :given_name => 'Douglas', :family_name => 'Adams' },
                         { :given_name => 'J.R.R.',  :family_name => 'Tolkien' },
                         { :given_name => 'Lewis',   :family_name => 'Carrol' },
                         { :given_name => 'David',   :family_name => 'Brin' },
                         { :given_name => 'Barbara', :family_name => 'Kafka' }
])

books = Book.create([{ :title => 'The Salmon of Doubt',
                       :is_active => true,
                       :isbn10 => '1234567890',
                       :isbn13 => '1234567890123',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[0].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Long Dark Teatime of the Soul',
                       :is_active => true,
                       :isbn10 => '1234567891',
                       :isbn13 => '1234567890124',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[0].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Hobbit',
                       :is_active => true,
                       :isbn10 => '1234567892',
                       :isbn13 => '1234567890125',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Fellowship of the Ring',
                       :is_active => true,
                       :isbn10 => '1234567893',
                       :isbn13 => '1234567890126',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Two Towers',
                       :is_active => true,
                       :isbn10 => '1234567894',
                       :isbn13 => '1234567890127',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Return of the King',
                       :is_active => true,
                       :isbn10 => '1234567895',
                       :isbn13 => '1234567890128',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'Alice in Wonderland',
                       :is_active => true,
                       :isbn10 => '1234567896',
                       :isbn13 => '1234567890129',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[2].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => "Alice's Adventures Beyond the Looking Glass",
                       :is_active => true,
                       :isbn10 => '1234567897',
                       :isbn13 => '1234567890130',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[2].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Uplift War',
                       :is_active => true,
                       :isbn10 => '1234567898',
                       :isbn13 => '1234567890131',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[3].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'Brightness Reef',
                       :is_active => true,
                       :isbn10 => '1234567899',
                       :isbn13 => '1234567890132',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[3].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Opinionated Palate',
                       :is_active => true,
                       :isbn10 => '1234567900',
                       :isbn13 => '1234567890133',
                       :owner_id => users[1].id,
                       :true_user_id => users[1].id,
                       :author_id => authors[4].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     }
])

[ [ books[0], ['science fiction', 'funny']],
  [ books[2], ['fantasy']],
  [ books[6], ['funny', "children's", 'fantasy']],
  [ books[8], ['science fiction', 'chimpanzees']],
  [ books[10], ['food', 'funny']]
].each do |book, tags|
  seed_tags_to_books book, tags
end

reviews = Review.create([{ :user_id => users[1].id,
                           :true_user_id => users[1].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic a'
                         }, 
                         { :user_id => users[2].id,
                           :true_user_id => users[2].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic b'
                         }, 
                         { :user_id => users[3].id,
                           :true_user_id => users[3].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic c'
                         }, 
                         { :user_id => users[4].id,
                           :true_user_id => users[4].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic d'
                         }, 
                         { :user_id => users[5].id,
                           :true_user_id => users[5].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic e'
                         }, 
                         { :user_id => users[6].id,
                           :true_user_id => users[6].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic f'
                         }, 
                         { :user_id => users[7].id,
                           :true_user_id => users[7].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic g'
                         }, 
                         { :user_id => users[8].id,
                           :true_user_id => users[8].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic h'
                         }, 
                         { :user_id => users[9].id,
                           :true_user_id => users[9].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic i'
                         }, 
                         { :user_id => users[10].id,
                           :true_user_id => users[10].id,
                           :book_id => books[0].id,
                           :text    => 'fantastic j'
                         } 
])

