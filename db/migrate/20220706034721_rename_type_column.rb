class RenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :bike, :type, :category
  end
end
