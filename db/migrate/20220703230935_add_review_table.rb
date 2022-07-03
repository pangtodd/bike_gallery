class AddReviewTable < ActiveRecord::Migration[5.2]
  def change
    create_table :review do |t|
      t.string :author
      t.string :content
      t.integer :rating
      t.integer :bike_id

      t.timestamps()
    end
  end
end
