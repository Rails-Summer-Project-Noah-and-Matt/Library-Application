class ChangeDataTypeForIsActive < ActiveRecord::Migration
  def change
    change_column :books, :is_active, :boolean, default: true
  end
end
