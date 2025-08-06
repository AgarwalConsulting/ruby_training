# Lets subclasses decide which class to instantiate.

class Document
  def self.create(type)
    case type
    when :pdf then PdfDocument.new
    when :word then WordDocument.new
    else raise "Unknown type"
    end
  end
end
