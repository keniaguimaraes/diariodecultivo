class CreateEfeitodiarios < ActiveRecord::Migration[6.0]
  def change
    create_table :efeitodiarios do |t|
      t.integer :diario_id
      t.integer :efeitocolateral_id

      t.timestamps
    end
  end
end
