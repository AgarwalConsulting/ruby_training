a = [1, 2, 3, 4, 5]

f_val, *r_val = a

f_val, s_val, *r_val = a

# Pattern matching `=>`
a => [f_val, 2, *r_val]

#---

h = {:city => "Chennai", :country => "India"}

h => {city: place_of_stay}
h => {city:}

puts city
