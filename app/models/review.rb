class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :buyer, :class_name => "User"
end
