class User < ApplicationRecord
  has_secure_password

  has_many :items, :foreign_key => "seller_id"
  belongs_to :location
  has_many :reviews, :foreign_key => "buyer_id"
  has_many :reservations, through: :items

  validates :name, :username, :email, :age, :location_name, :password, presence: true
  validates :name, :username, :email, :age, :location_name, :password, uniqueness: true

  def location_name=(name)
    loc = Location.find_or_create_by(name: name)
    self.location = loc
  end

  def location_name
    self.location
  end

end
