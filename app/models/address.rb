class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :destination

  validates :address_last_name, :address_first_name, :address_last_name_kana, :address_first_name_kana, :postal_code, :prefecture, :city, :house_number, presence: true
end
