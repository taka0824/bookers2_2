class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end
end
