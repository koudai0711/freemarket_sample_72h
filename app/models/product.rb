class Product < ApplicationRecord
  belongs_to :user 
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  belongs_to_active_hash :prefecture
end
