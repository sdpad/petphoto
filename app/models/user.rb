class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :posts

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user

  has_many :favorites
  has_many :likes, through: :favorites, source: :post

  has_many :comments

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def feed_posts
    Post.where(user_id: following_ids + [id])
  end

  def favorite(post)
    favorites.find_or_create_by(post_id: post.id)
  end

  def unfavorite(post)
    favorite_thing = favorites.find_by(post_id: post.id)
    favorite_thing.destroy if favorite_thing
  end

  def favoriting?(post)
    likes.include?(post)
  end
end
