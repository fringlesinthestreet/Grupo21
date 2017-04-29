class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :nombre
      t.date :ano
      t.string :lenguaje
      t.string :director
      t.string :actores
      t.string :genero
      t.text :resumen

      t.timestamps
    end
  end
end
