class AddTrueUserIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :true_user_id, :integer
  end
end
