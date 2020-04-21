class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :destination

  validates :postal_code, :prefecture_id, :city, :house_number, presence: true
  validates :address_last_name, :address_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :address_last_name_kana, :address_first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
