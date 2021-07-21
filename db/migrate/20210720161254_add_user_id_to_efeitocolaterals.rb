class AddUserIdToEfeitocolaterals < ActiveRecord::Migration[6.0]
  def change
    add_column :efeitocolaterals, :user_id, :integer
  end
end
