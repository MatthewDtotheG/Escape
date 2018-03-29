class Reservation < ApplicationRecord

  belongs_to :item
  belongs_to :buyer, :class_name => "User"
  has_one :review

  validate :available?, :rent_start_after_rent_end?, :rent_start_equal_rent_end?

  def available?
    if rent_start < rent_end
      Reservation.where(item_id: item.id).where.not(id: id).each do |r|
        if r.rent_end >= rent_start && r.rent_end <= rent_end
          errors.add(:base, "Sorry, this item isn't available during your requested dates!")
        elsif r.rent_start <= rent_end && r.rent_start >= rent_start
          errors.add(:base, "Sorry, this item isn't available during your requested dates!")
        elsif rent_start <= r.rent_start && r.rent_end <= rent_end
          errors.add(:base, "Sorry, this item isn't available during your requested dates!")
        elsif r.rent_start <= rent_start && rent_end <= r.rent_end
          errors.add(:base, "Sorry, this item isn't available during your requested dates!")
        else
          true
        end
      end
    end
  end

  def rent_start_after_rent_end?
    if rent_end < rent_start
      errors.add(:base, "Rent end date has to be after the start!")
    end
  end

  def rent_start_equal_rent_end?
    if rent_end == rent_start
      errors.add(:base, "Have to rent for more than one day!")
    end
  end

  def total_price
    seconds_per_day = 86400
    total_days = (rent_end - rent_start)/seconds_per_day
    total_cost = total_days * self.item.price
  end

  def buyer_and_seller_not_the_same
    if buyer_id == self.item.seller_id
      errors.add(:buyer_id, "You can't rent your own items.")
    end
  end

 def rent_end_after_rent_start
   if rent_end && rent_start && rent_end <= rent_start
     errors.add(:buyer_id, "Your check-out date needs to be after your check-in.")
   end
 end

end
