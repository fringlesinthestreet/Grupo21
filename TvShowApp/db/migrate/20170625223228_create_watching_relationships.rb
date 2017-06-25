class CreateWatchingRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :watching_relationships do |t|
      t.integer :watcher_id
      t.integer :watched_id

      t.timestamps
    end
    add_index :relationships, :watcher_id
    add_index :relationships, :watched_id
    add_index :relationships, [:watcher_id, :watched_id], unique: true
  end
end
