class AddBikeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bike do |t|
      t.string :name
      t.string :make
      t.string :model
      t.string :type
      t.string :size
      t.integer :year
      t.string :description 
      t.string :color
      t.string :status
      t.integer :price
      
      t.timestamps()
    end
  end
end




