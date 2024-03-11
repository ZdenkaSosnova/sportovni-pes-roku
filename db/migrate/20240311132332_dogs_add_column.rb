class DogsAddColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :date_of_birth, :string
  end
end
