require 'net/http'
require 'uri'

# uri = URI('http://localhost:5678') # Raw Server
uri = URI('http://localhost:8080/ping') # Webrick Server

response = Net::HTTP.get_response(uri)

puts "Response: #{response.code} #{response.body}"
