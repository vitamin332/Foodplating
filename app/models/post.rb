class Post < ApplicationRecord
  # アソシエーション
  belongs_to :user
  # dependent 親に紐付いた子モデルも一緒に削除
  # 例えばユーザーが退会した場合、そのユーザーが投稿した記事も全て消える
  has_many :favorites, dependent: :destroy 
  

  # 画像取得・アップロード
  attachment :image

  validates :cooking_title, presence: true
  validates :caption, presence: true
  validates :image, presence: true
end
