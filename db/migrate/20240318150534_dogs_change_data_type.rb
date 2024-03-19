class DogsChangeDataType < ActiveRecord::Migration[7.1]
  def change
    change_column :dogs, :date_of_birth, :date
  end
end
