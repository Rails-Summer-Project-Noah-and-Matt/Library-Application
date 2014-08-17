class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :given_name
      t.string :family_name

      t.timestamps
    end
  end
end
