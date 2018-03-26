class User < ApplicationRecord
  has_many :items, foreign_key: :seller_id
  belongs_to :location
  has_many :reviews
  has_many :reservations, through: :items

end
