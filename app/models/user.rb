class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :posts, dependent: :destroy
  # プロフィール用画像保存
  attachment :profile_image

  validates :name, presence: true
  validates :email, presence: true
end
