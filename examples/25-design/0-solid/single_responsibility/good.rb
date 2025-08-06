# * `Invoice`: handles business logic.
class Invoice
  def initialize(customer, items)
    @customer = customer
    @items = items
  end

  def total
    @items.sum(&:price)
  end
end

# * `InvoicePrinter`: handles presentation.
class InvoicePrinter
  def self.print(invoice)
    puts "Invoice for #{invoice.customer}"
    puts "Total: #{invoice.total}"
  end
end
