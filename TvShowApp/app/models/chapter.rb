class Chapter < ApplicationRecord
  belongs_to :tv_show
  has_many :passive_relationships, class_name:  "WatchingRelationship",
                                   foreign_key: "watched_id",
                                   dependent:   :destroy

  has_many :watchers, through: :passive_relationships, source: :watcher
end
