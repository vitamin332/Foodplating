class Post < ApplicationRecord
  # アソシエーション
  belongs_to :user
  # 画像取得・アップロード
  attachment :image

  validates :cooking_title, presence: true
  validates :caption, presence: true
  validates :image, presence: true
end
