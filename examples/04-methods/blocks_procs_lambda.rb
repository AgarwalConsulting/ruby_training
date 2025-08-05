by = 2

[1,2,3,4,5].map do |x|
  x * by
end

[1,2,3,4,5].map { |x| x * 2 }

# ---

def doubler(x)
  x * by
end


# ---

doublerp = Proc.new { |x| x * by }

# ---

l = lambda { |x| x * by }
