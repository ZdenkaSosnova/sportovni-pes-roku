class AddDogId < ActiveRecord::Migration[7.1]
  def change
    add_column :herdings, :dog_id, :integer
  end
end
