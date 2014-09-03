Library-Application
===================

Ruby version 2.1

DB initalize:
```
rake db:setup
```

Testing:
```
rake
```

Production Dependencies
=======================
You will need 

libpq-dev for postgres
```
$ sudo apt-get install libpq-dev   # on Ubuntu / Debian
```
https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres

libmagickwand-dev or something similar for rmagick
```
$ sudo apt-get install libmagickwand-dev 
$ sudo apt-get install graphicsmagick-libmagick-dev-compat  # for ubuntu 12
$ sudo apt-get install libmagick9-dev  # for ubuntu 11 or below.
$ yum install ImageMagick-devel  # for centos
$ brew install imagemagick # for Mac OS (using Homebrew)
```

http://stackoverflow.com/questions/3894225/imagemagick-rmagick-cant-install-rmagick-2-13-1-cant-find-magick-config

README TODOs
=======================

Things to cover:

* System dependencies

* Configuration

* Database creation

* Database initialization

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

[![Build Status](https://travis-ci.org/Rails-Summer-Project-Noah-and-Matt/Library-Application.png?branch=master)](https://travis-ci.org/Rails-Summer-Project-Noah-and-Matt/Library-Application)
[![Code Climate](https://codeclimate.com/github/Rails-Summer-Project-Noah-and-Matt/Library-Application.png)](https://codeclimate.com/github/Rails-Summer-Project-Noah-and-Matt/Library-Application)


Project Plan: 
  - Build a GIT repo to share with Noah
  - We are going to be strict about testing
  - Failing tests or code w/o tests gets committed to a branch
  - Passing tests get merged to master with an issue number
  - No commits / merges to master w/o issue number

Concerns:
  - Multiple branches could cause issues with DB migrations

Progress Tracking:
  - We'll use GIT issues for Project Tracking

Database Schema:
  - Books
    - Multiple Books can have the same title
    - is_active
    - cover (using carrierwave Uploader)
    - owner (foreign key to user_id, for req 5 only edit book you entered)
    - isbn10
    - isbn13
    - belongs_to :author
    - has_one :book_cover
    - has_many :book_tags
    - tags done through Acts_As_Taggable_On
    - has many :book_ratings
    - has_many :ratings, though :book_ratings
    - has_many :reviews
  - Ratings
    - has_many :book_ratings
    - has_many :books, through :book_ratings
  - Reviews
    - text will be searchable - we think we will use a rails sql wrapper,
      not regex/ruby
    - book
    - user
    - review
  - Authors 
    - first_name
    - last_name
    - has_many :books
  - Users
    - Reviews and Tags, ratings
    - email
    - username
    - is admin ?
    - is_blocked (req 18)
    - email preferences - how to handle - req 11-16 - probably one or more 
      add'l tables
    - ? should we do a hook for "activity", or gen reports as requested?
      (for req 20) - I think as requested.
    - has_many :books
    - has_many :followed_books           #(req 12)
    - has_many :books, through :followed_books
    - receives_ratings (boolean)  #(req13)
    - receives_reviews (boolean)  #(req14)
    - receives_notifications_of_owned_book_rating_or_review (boolean) #(req11)
    - emails_as_daily_digest (boolean) #(req16)
  - Followed_Books
    - book
    - user
    - following (boolean)
    - receives_ratings (boolean)  #(req13)
    - receives_reviews (boolean)  #(req14)
  Database:
    - SQlite for Dev and Test
    - Postgres for Production

### Renée's specs
    1.	✓Anyone can see all the book titles and ratings in the library
    2.	✓You must login to add library books
    3.	✓Admin must approve the addition of lib books
    4.	✓You must be logged in to rate a book
    5.	To rate a book you must click on stars
    6.	✓You can give a book 1-5 stars
    7.	✓You can add a review to any book
    8.	✓You can only edit/destroy books you entered into the system
    9.	✓If a book has ratings or reviews, you can not destroy it, only
        deactivate it
    10.	✓Deactivated books can not get new reviews or ratings
    11.	✓Users can receive emails when their books get rated or reviewed
    12.	✓Users can "follow" books - which means they get email notifications on
        ratings and reviews
    13.	Users can opt out of all or by book rating emails 
    14.	Users can opt out of all or by book review emails
    15.	✓Users can configure their email preferences
    16. Users can ask to receive a daily digest of email notifications instead
        of individual notifications
    17.	✓Books must have a picture associated with them to be approved
    18.	✓Admins can block users from creating ratings or reviews in the system
    19.	✓Books should be searchable by title, author, ISBN, tags, ratings, and
        reviews 
    20.	✓Admins can see a report of activities by User: Most active* users,
        Users who give the lowest ratings, Users who give the highest ratings,
        Users who login most often, Users with the most reviews, and Users who
        enter the most books.
    21.	✓Book and review listings are sortable, and paginated (default sort for
        Books and Reviews is rating)
    22.	✓Admins can create/invite other admins
    23.	Users can invite other users
    24.	✓Admins can login as any other user in the system
    25.	✓When an Admin logs in as another user, the Admin's activities do not
        impact the User's activity ratings in the system

    2.	Code Climate 3.0 or better
    3.	100% code test coverage via Simple Cov 
    6.	ReadMe with setup instructions for your app and CodeClimate Badge
    7.	Should not be ugly (twitter-bootstrap, Zurb foundation, or your own
        styles applied is fine, but something nicer than default rails stuff.)
