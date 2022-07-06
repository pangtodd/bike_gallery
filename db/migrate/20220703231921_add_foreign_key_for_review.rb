class AddForeignKeyForReview < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :review, :bike
  end
end
