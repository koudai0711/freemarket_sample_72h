class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # validates :size, presence: true
  validates :status, presence: true
  # validates :prefecture, presence: true
  validates :shipping_cost, presence: true
  validates :shipping_days, presence: true
  # validates :shipping_id, presence: true
end
