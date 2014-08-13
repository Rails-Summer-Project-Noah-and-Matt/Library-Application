class AddIsbnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :isbn10, :string
    add_column :books, :isbn13, :string
    add_index :books, :isbn10
    add_index :books, :isbn13
  end
end

