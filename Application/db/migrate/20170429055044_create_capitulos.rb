class CreateCapitulos < ActiveRecord::Migration[5.0]
  def change
    create_table :capitulos do |t|
      t.string :nombre
      t.time :duracion
      t.text :resumen

      t.timestamps
    end
  end
end
