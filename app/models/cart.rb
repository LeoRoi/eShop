# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product) #wenn product schon in cart, quantity line_items +1, sonst eine neue
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def remove_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item && current_item.quantity > 0
      current_item.quantity -= 1
    end
    current_item
  end


  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
