require 'async/http/internet'

def fetch(url)
	Sync do
		internet = Async::HTTP::Internet.new
		return internet.get(url).read
	end
end

# At the level of your program, this method will create an event loop:
fetch("https://algogrit.com")

Sync do
	# The event loop already exists, and will be reused:
	# fetch(...)
end
