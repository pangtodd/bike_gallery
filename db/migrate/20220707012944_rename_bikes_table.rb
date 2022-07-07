class RenameBikesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :bike, :bikes
  end
end