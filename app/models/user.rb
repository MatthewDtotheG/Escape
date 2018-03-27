class User < ApplicationRecord
  has_secure_password

  has_many :items, :foreign_key => "seller_id"
  belongs_to :location
  has_many :reviews, :foreign_key => "buyer_id"
  has_many :reservations, through: :items

  validates :name, :username, :email, :age, :location, :password, presence: true
  validates :username, :email, uniqueness: true

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

end
