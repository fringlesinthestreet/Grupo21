class TvShow < ApplicationRecord

  belongs_to :user
  has_many :chapter

  has_many :active_relationships, class_name:  "CategoryRelationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  # Follows a user.
  def follow(category)
    following << category
  end

  # Unfollows a user.
  def unfollow(category)
    following.delete(category)
  end

  # Returns true if the current user is following the other user.
  def following?(category)
    following.include?(category)
  end

end
