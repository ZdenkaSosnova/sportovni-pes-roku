class AddMemberId < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :external_id, :string
  end
end
