class Item < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :buyers, :class_name => "User", :through => :reservations

  def self.sort_by_price_asc
    Item.order(:price)
  end

  def self.sort_by_price_desc
    Item.order(price: :desc)
  end



end
