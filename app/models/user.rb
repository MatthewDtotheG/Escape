class User < ApplicationRecord
  has_secure_password

  has_many :items, :foreign_key => "seller_id"
  belongs_to :location
  has_many :reviews, :foreign_key => "buyer_id"
  has_many :reservations, :foreign_key => "buyer_id"


  validates :name, :username, :email, :age, :location, :password_digest, presence: true
  validates :username, :email, uniqueness: true

  def rentals
    reservations.map {|res| res.item}
  end

  def seller_check
    sellers = Item.all.map {|x| x.seller_id}
    sellers.include?(self.id)
  end

  def buyer_check
    buyers = Reservation.all.map {|x| x.buyer_id}
    buyers.include?(self.id)
  end

  def location_name=(name)
    self.location = Location.find_or_create_by(name: name)
  end

  def location_name
    self.location
  end

  def avg_rating
    all_ratings = reviews.map {|r| r.rating}
    all_ratings.inject(:+).to_f/all_ratings.size
  end

  def total_profit
    reservations.map {|res| res.total_price}.inject(:+)
  end

  def already_reserved?
  end


end
