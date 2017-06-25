class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.time :duracion
      t.text :resumen
      t.integer :numero
      t.integer :temporada
      t.string :nombre

      t.timestamps
    end
  end
end
