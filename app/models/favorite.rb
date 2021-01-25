class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :comment, optional: true
  belongs_to :book, optional: true
  # いいねの対象がどっちか一方の為、optional: trueでnilを許すようにする
end
