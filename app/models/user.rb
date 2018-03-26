class User < ApplicationRecord
  has_many :items, :foreign_key => "seller_id"
  belongs_to :location
  has_many :reviews, :foreign_key => "buyer_id"
  has_many :reservations, through: :items

end
