class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def remove_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item.quantity>1
      current_item.quantity -= 1
    else
      current_item.destroy
    end
    current_item
  end

end
