class AddIndexToChapters < ActiveRecord::Migration[5.0]
  def change
    add_reference :chapters, :tv_show, foreign_key: true
  end
end
