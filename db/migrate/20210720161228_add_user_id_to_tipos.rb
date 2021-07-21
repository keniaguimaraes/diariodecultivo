class AddUserIdToTipos < ActiveRecord::Migration[6.0]
  def change
    add_column :tipos, :user_id, :integer
  end
end
