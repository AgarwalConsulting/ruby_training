require 'async/http/internet'

def fetch(url)
	Sync do
		puts "Request..."
		internet = Async::HTTP::Internet.new
		res = internet.get(url).read
		puts "Done"
		res
	end
end

# At the level of your program, this method will create an event loop:
puts fetch("https://algogrit.com")

puts "Some other long processing..."

# Sync do
# 	# The event loop already exists, and will be reused:
# 	# fetch(...)
# end
