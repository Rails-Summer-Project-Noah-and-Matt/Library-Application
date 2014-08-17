class AddAuthorIdtoBooks < ActiveRecord::Migration
  def change
    add_column :books, :author_id, :integer
    add_index  :books, :author_id
  end
end
