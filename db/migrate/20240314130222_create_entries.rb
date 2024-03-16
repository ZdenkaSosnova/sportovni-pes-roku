class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :herding do |t|
      t.string :category
      t.integer :points
      t.integer :position
      t.integer :num_dogs
      t.integer :final_points
      t.timestamps
    end
  end
end
