class Card < ApplicationRecord
  belongs_to :user
  
  validates  :user, :customer_id, :card_id, presence: true
end
