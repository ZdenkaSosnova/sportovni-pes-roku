class RenameIncorrectTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :herding, :herdings
  end
end
