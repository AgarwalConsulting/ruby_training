# Allows classes with incompatible interfaces to work together.

class LegacyPrinter
  def old_print(msg)
    puts "Legacy: #{msg}"
  end
end

class PrinterAdapter
  def initialize(printer)
    @printer = printer
  end

  def print(msg)
    @printer.old_print(msg)
  end
end
