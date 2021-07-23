class AddCidIdToAcompanhamentos < ActiveRecord::Migration[6.0]
  def change
    add_column :acompanhamentos, :cid_id, :integer
  end
end
