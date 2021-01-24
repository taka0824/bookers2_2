class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follower, class_name:"Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローする立場、follower_idとしてrelationshipテーブルに自分のidを複数持つ（中間テーブルとの関係）
  has_many :followed, class_name:"Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローされる立場、followed_IDとしてrelationshipテーブルに自分のidを複数持つ（中間テーブルとの関係）
  has_many :following_users, through: :follower, source: :followed
  # 自分がフォローする立場(follower)、Relationshipのfollowerを通してfollowed(user)からfollowing_usersを持っている
  has_many :follower_users, through: :followed, source: :follower
  # 自分がフォローされる立場(followed)、Relationshipのfollowedを通してfollower(user)からfollower_usersを持っている
  
  def follow(user_id)
    self.follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    self.follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    self.following_users.include?(user)
  end
  
end
