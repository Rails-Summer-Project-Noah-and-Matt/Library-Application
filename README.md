Library-Application
===================

Rails Summer Library Application

Things to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

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
    - picture (foreign key to book_covers)
    - owner (foreign key to user_id, for req 5 only edit book you entered)
    - has_many :book_authors
    - has_many :authors, through :book_authors
    - has_many :isbn
    - has_many :book_covers
    - has_many :book_tags
    - has_many :tags, through :book_tags
    - has many :book_ratings
    - has_many :ratings, though :book_ratings
    - has_many :reviews
  - Book_Covers
    - foreign key book
    - book_cover
  - Tags
    - has_many :book_tags
    - has_many :books, through :book_tags
  - Ratings
    - has_many :book_ratings
    - has_many :books, through :book_ratings
  - Reviews
    - text will be searchable - we think we will use a rails sql wrapper,
      not regex/ruby
    - book
    - user
    - review
  - ISBN 
    - foreign key book
    - isbn
  - Authors 
    - first_name
    - last_name
    - has_many :book_authors
    - has_many :books, through :book_authors
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
    - has_many :owned_books
    - has_many :books, through :owned_books
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

