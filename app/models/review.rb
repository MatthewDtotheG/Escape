class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :buyer, :class_name => "User"

  def self.average_rating
    Review.all.map {|r| r.rating}.inject(:+).to_f/Review.all.size
  end
  
end
