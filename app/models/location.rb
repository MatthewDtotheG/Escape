class Location < ApplicationRecord
  has_many :users

  def has_items?
    if users.map {|user| user.items}.flatten
      true
    end
  end

  def items
    if has_items?
      items = users.map {|user| user.items}.flatten
      items.map {|item| item.name}
    end
  end

end
