class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.string :genre
      t.string :country
      t.string :language
      t.string :actors
      t.string :director
      t.integer :seasons

      t.timestamps
    end
  end
end
