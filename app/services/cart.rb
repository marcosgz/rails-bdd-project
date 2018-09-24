# frozen_string_literal: true

class Cart
  def initialize(user, product_ids)
    @user = user
    @products = Product.where(id: product_ids)
  end

  def order_total
    @order_total ||= @products.sum(&:price)
  end

  def discount
    case @user.rating
    when 'Good'
      order_total > 10 ? 1 : 0
    when 'Excellent'
      order_total > 50 ? 5 : 1
    else
      0
    end
  end
end
