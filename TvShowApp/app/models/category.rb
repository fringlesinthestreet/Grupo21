class Category < ApplicationRecord
  

  has_many :passive_relationships, class_name:  "CategoryRelationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
