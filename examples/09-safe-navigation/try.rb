a = ["Harry", "Sally", "Bob"]
# a = ["Harry", "Sally", "Bob", 1]

pp a[3] # nil

# a[3].upcase # ?

# pp a[3].try(:upcase)
pp a[3]&.upcase
