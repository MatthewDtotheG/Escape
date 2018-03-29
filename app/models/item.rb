class Item < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :reservations, dependent: :destroy
  has_many :reviews, :through => :reservations
  has_many :buyers, :class_name => "User", :through => :reservations


  def image_grabber
    Dir["./public/#{self.category}/*"].sample.split("public").last
  end

  def self.all_categories
    ["Winter Sports", "Camping & Hiking", "Water Sports"]
  end

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
