db = {}

loop do
  puts "Enter a department:"
  department = gets.strip
  puts "Enter a employee name:"
  name = gets.strip

  # list_of_employees = db[department] || [] # Lookup or Create a new list

  existing_list_of_employees = db[department]
  if existing_list_of_employees == nil
    list_of_employees = []
  else
    list_of_employees = existing_list_of_employees
  end

  list_of_employees << name # Append into the list

  db[department] = list_of_employees # Add (Creates the entry) or Update (Overwrites)

  pp db
end
