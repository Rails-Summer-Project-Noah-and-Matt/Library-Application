class AddTrueUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :true_user_id, :integer
  end
end
