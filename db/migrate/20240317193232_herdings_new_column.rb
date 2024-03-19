class HerdingsNewColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :herdings, :event_place, :string
    add_column :herdings, :event_date, :date
  end
end
