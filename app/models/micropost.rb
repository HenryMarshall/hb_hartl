class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


  def self.from_users_followed_by(user)
    # this code is heavily revamped for efficiency in 11.3.3

    followed_user_ids = "SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id"

    # The following are equivalent, both were deprecated for subset selection
    # followed_user_ids = user.followed_user_ids
    # followed_user_ids = User.first.followed_users.map(&:id)

    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user)
    # Deprecated for above to improve efficiency in situations where a user is
    # subscribed to many other users (e.g., 5000)
  end

end
