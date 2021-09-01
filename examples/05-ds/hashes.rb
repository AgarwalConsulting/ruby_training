h = Hash.new("URL not found")

h["Oksana Yatskiv"] = "http://ec2-18-206-77-119.compute-1.amazonaws.com/vnc.html?host=ec2-18-206-77-119.compute-1.amazonaws.com&port=80"
h["Murali Basupalli"] =  "http://ec2-18-207-32-100.compute-1.amazonaws.com/vnc.html?host=ec2-18-207-32-100.compute-1.amazonaws.com&port=80"
h["Kenneth Donley"] =  "http://ec2-18-214-112-255.compute-1.amazonaws.com/vnc.html?host=ec2-18-214-112-255.compute-1.amazonaws.com&port=80"
h["Dominick Gomez"] =  "http://ec2-23-22-70-186.compute-1.amazonaws.com/vnc.html?host=ec2-23-22-70-186.compute-1.amazonaws.com&port=80"

# ---

h["Oksana Yatskiv"] = "some other url"

# h["name"] = "Gaurav"
# h["age"] = 30
# h[:city] = "Chennai"

pp h

pp "What's the url to Yatskiv's machine?"
pp h["Oksana Yatskiv"]

pp "What's the url to Gaurav's machine?"
pp h["Gaurav Agarwal"]
