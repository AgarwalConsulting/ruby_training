s = "Hello"

class << s
  def blank?
    self.strip.empty?
  end
end

puts s.blank?

puts " ".blank?
