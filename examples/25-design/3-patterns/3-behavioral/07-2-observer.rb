require 'observer'

class Stock
  include Observable

  attr_reader :price

  def update_price(new_price)
    @price = new_price
    changed
    notify_observers(self)
  end
end

class AlertService
  def update(stock)
    puts "New price: #{stock.price}"
  end
end

stock = Stock.new
stock.add_observer(AlertService.new)
stock.update_price(102.5)
