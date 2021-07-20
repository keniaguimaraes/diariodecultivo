class CreateEfeitocolaterals < ActiveRecord::Migration[6.0]
  def change
    create_table :efeitocolaterals do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
