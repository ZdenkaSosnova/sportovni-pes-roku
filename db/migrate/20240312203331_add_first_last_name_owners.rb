class AddFirstLastNameOwners < ActiveRecord::Migration[7.1]
  def change
    rename_column :owners, :name, :first_name
    add_column :owners, :last_name, :string
  end
end
