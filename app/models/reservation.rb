class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, :class_name => "User"
  has_one :review
end
