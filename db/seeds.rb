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
                     { :email => 'user@example.com', :password => 'foobarbaz', :admin => false, :password_confirmation => 'foobarbaz'}
                   ])

authors = Author.create([{ :given_name => 'Douglas', :family_name => 'Adams' },
                         { :given_name => 'J.R.R.', :family_name => 'Tolkien' },
                         { :given_name => 'Lewis', :family_name => 'Carrol' },
                         { :given_name => 'David', :family_name => 'Brin' },
                         { :given_name => 'Barbara', :family_name => 'Kafka' }
])

books = Book.create([{ :title => 'The Salmon of Doubt',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[0].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Long Dark Teatime of the Soul',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[0].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Hobbit',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Fellowship of the Ring',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Two Towers',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Return of the King',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[1].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'Alice in Wonderland',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[2].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => "Alice's Adventures Beyond the Looking Glass",
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[2].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Uplift War',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[3].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'Brightness Reef',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[3].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     },
                     { :title => 'The Opinionated Palate',
                       :is_active => true,
                       :owner_id => users[1].id,
                       :author_id => authors[4].id,
                       :cover => File.open(File.join(Rails.root, '/db/seed-images/cover.gif'))
                     }
])

[ [ books[0], ['science fiction', 'funny']],
  [ books[1], ['fantasy']],
  [ books[2], ['funny', "children's", 'fantasy']],
  [ books[3], ['science fiction', 'chimpanzees']],
  [ books[4], ['food', 'funny']]
].each do |book, tags|
  seed_tags_to_books book, tags
end

