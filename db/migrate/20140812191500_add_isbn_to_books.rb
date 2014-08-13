class AddIsbnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :isbn10, :integer
    add_column :books, :isbn13, :integer
    add_index :books, :isbn10
    add_index :books, :isbn13
  end
end

