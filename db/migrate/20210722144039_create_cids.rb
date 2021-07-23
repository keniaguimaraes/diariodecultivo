class CreateCids < ActiveRecord::Migration[6.0]
  def change
    create_table :cids do |t|
      t.string :codigo
      t.string :doenca

      t.timestamps
    end
  end
end
