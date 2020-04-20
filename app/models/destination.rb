class Destination < ApplicationRecord
  belongs_to :user, optional: true
  has_many :addresses, dependent: :destroy

end
