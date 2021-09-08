require 'socket'
require 'rack'
require 'rack/lobster'

# app = Proc.new do
#   ['200', {'Content-Type' => 'text/html'}, ["Hello world! The time is #{Time.now}"]]
# end

app = Rack::Lobster.new

server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  # method, full_path = request.split(' ')
  # path, query = full_path.split('?')

  # 1
  status, headers, body = app.call({})

  # 2
  session.print "HTTP/1.1 #{status}\r\n"

  # 3
  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end

  # 4
  session.print "\r\n"

  # 5
  body.each do |part|
    session.print part
  end
  session.close
end

# 1. Get the status code, headers, and body from the triplet returned by app.call.
# 2. Use the status code to build the status line
# 3. Loop over the headers and add a header line for each key-value pair in the hash
# 4. Print a newline to separate the status line and headers from the body
# 5. Loop over the body and print each part. Since there’s only one part in our body array, it’ll simply print our “Hello world”-message to the session before closing it.
