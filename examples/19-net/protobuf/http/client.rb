require 'net/http'
require_relative './user_pb'

user = User.new(name: "Alice", age: 30)
uri = URI("http://localhost:8000/user")

response = Net::HTTP.start(uri.host, uri.port) do |http|
  req = Net::HTTP::Post.new(uri.path)
  req.body = user.encode
  req['Content-Type'] = 'application/x-protobuf'
  http.request(req)
end

if response.code == '200'
  updated_user = User.decode(response.body)
  puts "Updated user: #{updated_user.name}, age: #{updated_user.age}"
else
  puts "Error: #{response.body}"
end
