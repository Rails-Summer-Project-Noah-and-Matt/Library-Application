class AddRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rating, :float
  end
end
