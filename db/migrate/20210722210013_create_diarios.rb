class CreateDiarios < ActiveRecord::Migration[6.0]
  def change
    create_table :diarios do |t|
      t.integer :acompanhamento_id
      t.string :dosagem
      t.integer :administracao_id
      t.date    :data
      t.text :anotacoes
      #t.datetime :inicio_tratamento
      t.timestamps
    end
  end
end
