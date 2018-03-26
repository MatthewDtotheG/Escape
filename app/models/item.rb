class Item < ApplicationRecord
  belongs_to :location, required: true
  belongs_to :seller, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :buyers, :class_name => "User", :through => :reservations
end
