class CreateAcompanhamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :acompanhamentos do |t|
      t.string :medicamento
      t.integer :tipo_id
      t.datetime :inicio_tratamento
      t.datetime :fim_tratamento
      t.string :paciente
      t.integer :idade
      t.integer :genero_id
      t.string :medico
      t.string :crm
      t.text :finalidade
      t.integer :user_id
      t.timestamps
    end
  end
end
