
class Product < ApplicationRecord 
  belongs_to :user 
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['src'].blank? }

  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User"
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :shipping_cost, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days, presence: true
  validates :size, presence: true
  validates_associated :images
end
