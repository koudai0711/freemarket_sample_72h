class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_one  :destination
  has_many :cards, dependent: :destroy
  has_many :addresses, dependent: :destroy
end


# バリデーションはここに書く