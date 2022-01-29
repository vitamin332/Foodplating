class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # プロフィール用画像保存
  attachment :profile_image

  validates :name, presence: true
  validates :email, presence: true

# いいね
  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end

end
