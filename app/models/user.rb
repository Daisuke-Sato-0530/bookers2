class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true,
    length: { minimum: 2, maximum: 20 }

  validates :introduction,
    length: { maximum: 10 }

  has_many :books, dependent: :destroy
  attachment :image
  attachment :profile_image
end
