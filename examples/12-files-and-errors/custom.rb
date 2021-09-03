class CustomError < StandardError
  def initialize(msg)
    @msg = msg
  end
end

raise CustomError.new "It just didn't work"
