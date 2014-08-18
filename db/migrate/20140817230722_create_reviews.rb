class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text     :text
      t.integer  :user_id
      t.integer  :book_id
      t.timestamps
    end
  end
end
