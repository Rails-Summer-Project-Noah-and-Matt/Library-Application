require "rails_helper"

RSpec.describe ReviewsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "books/1/reviews").to route_to("reviews#index", :book_id => "1")
    end

    it "routes to #new" do
      expect(:get => "books/1/reviews/new").to route_to("reviews#new", :book_id => "1")
    end

    it "routes to #show" do
      expect(:get => "books/1/reviews/1").to route_to("reviews#show", :id => "1", :book_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "books/1/reviews/1/edit").to route_to("reviews#edit", :id => "1", :book_id => "1")
    end

    it "routes to #create" do
      expect(:post => "books/1/reviews").to route_to("reviews#create", :book_id => "1")
    end

    it "routes to #update" do
      expect(:put => "books/1/reviews/1").to route_to("reviews#update", :id => "1", :book_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "books/1/reviews/1").to route_to("reviews#destroy", :id => "1", :book_id => "1")
    end

  end
end
