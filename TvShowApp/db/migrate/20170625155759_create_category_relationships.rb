class CreateCategoryRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :category_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps

    end
    add_index :category_relationships, :follower_id
    add_index :category_relationships, :followed_id
    add_index :category_relationships, [:follower_id, :followed_id], unique: true
  end
end
