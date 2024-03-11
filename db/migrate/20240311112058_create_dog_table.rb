class CreateDogTable < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.integer :owner_id
    end
  end
end
