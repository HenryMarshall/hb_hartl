class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_create :create_remember_token

  # validates user information
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  has_secure_password

  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  def feed
    # to be deprecated in ch 11
    Micropost.where("user_id = ?", id)
  end

  # relationships
  def following? other_user
    relationships.find_by followed_id: other_user.id
  end

  def follow! other_user
    relationships.create! followed_id: other_user.id
  end

  def unfollow! other_user
    relationships.find_by(followed_id: other_user.id).destroy
  end

  # remember token 
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest token
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest User.new_remember_token
    end

end
