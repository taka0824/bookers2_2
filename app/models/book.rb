class Book < ApplicationRecord
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # その本のIDを含むfavoritesのレコードに、引数のユーザーのレコードがあるか？
  end
end
