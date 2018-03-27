class Item < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :buyers, :class_name => "User", :through => :reservations

  def self.sort_by_price_asc
    order(:price)
  end

  def self.sort_by_price_desc
    order(price: :desc)
  end

  def self.hiking_camping
    where(category: "Camping & Hiking")
  end

  def self.winter_sports
    where(category: "Winter Sports")
  end

  def self.water_sports
    where(category: "Water Sports")
  end

end
