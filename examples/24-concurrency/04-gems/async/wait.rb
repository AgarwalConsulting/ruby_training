require 'async'

task = Async do
	rand
end

puts "The number was: #{task.wait}"
