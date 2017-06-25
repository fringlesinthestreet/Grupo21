class CategoryRelationship < ApplicationRecord
  belongs_to :follower, class_name: "TvShow"
  belongs_to :followed, class_name: "Category"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
