class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :product, optional: true
  validates :src, presence: true
end
