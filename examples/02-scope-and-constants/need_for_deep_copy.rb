def improve_grades(s)
  # s.grades = s.grades.map do |x|
  #   "S"
  # end
  s.grades.each do |x|
    puts "Initial X Object ID: #{x.object_id}"

    x[0] = "S" # Inplace
    # x = "S"

    puts "After X Object ID: #{x.object_id}"

  end
end

class Student
  attr_accessor :name, :grades
end

s = Student.new()
s.name = "Gaurav"
s.grades = ["A", "S", "A"]

puts [s.name, s.grades.join(", ")]

puts s.grades.object_id

puts "Grades Object ID: " + s.grades.map(&:object_id).join(", ")
# s.freeze

# s.name = "G A"
#
s1 = Marshal.load(Marshal.dump(s))

improve_grades(s1)

puts [s.name, s.grades.join(", ")] # ?
puts "Grades Object ID: " + s.grades.map(&:object_id).join(", ")

# s.freeze

# s1 = s.dup

# improve_grades(s1)

# puts [s1.name, s1.grades]
