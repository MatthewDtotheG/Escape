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

end
