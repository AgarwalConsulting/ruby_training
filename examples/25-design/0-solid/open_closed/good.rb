class Discount
  def apply(amount)
    amount
  end
end

class PercentageDiscount < Discount
  def apply(amount)
    amount * 0.9
  end
end

def checkout(total, discount = Discount.new)
  discount.apply(total)
end
