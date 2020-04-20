class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise      :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :products, dependent: :destroy
  has_one  :destination
  has_many :cards, dependent: :destroy
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "英文字のみが使えます" }
end

