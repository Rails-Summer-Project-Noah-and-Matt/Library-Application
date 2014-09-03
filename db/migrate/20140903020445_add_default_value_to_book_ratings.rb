class AddDefaultValueToBookRatings < ActiveRecord::Migration
  def up
    change_column :books, :rating, :float, default: 0.0   
  end

  def down
    change_column :books, :rating, :float, default: nil
  end
end
