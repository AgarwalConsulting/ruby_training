require 'webrick'
require_relative './user_pb' # from protoc

class SimpleServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    begin
      # Assume binary Protobuf data
      user = User.decode(request.body)

      puts "Received user: #{user.name}, Age: #{user.age}"

      # Build response
      user.age += 1 # mutate something
      response.status = 200
      response['Content-Type'] = 'application/x-protobuf'
      response.body = user.encode
    rescue => e
      response.status = 400
      response.body = "Bad Request: #{e.message}"
    end
  end
end

server = WEBrick::HTTPServer.new(Port: 8000)
server.mount "/user", SimpleServlet

trap("INT") { server.shutdown }
server.start
