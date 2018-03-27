class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, :class_name => "User"
  has_one :review

  def available(start_date, end_date)
    if end_date > rent_start && end_date < rent_end
      false
    elsif start_date < rent_end && start_date > rent_start
      false
    elsif rent_start < start_date && end_date < rent_end
      false
    elsif start_date < rent_start && rent_end < end_date
      false
    else
      true
    end
  end

  def total_price
    total_days = rent_end - rent_start
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
