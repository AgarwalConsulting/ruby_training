# https://blog.appsignal.com/2016/11/23/ruby-magic-building-a-30-line-http-server-in-ruby.html

require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print "Hello world! The time is #{Time.now}" # 4

  session.close
end

# 1. The status line (HTTP 1.1 200\r\n) to tell the browser that the HTTP version is 1.1 and the response code is “200”
# 2. A header to indicate that the response has a text/html content type (Content-Type: text/html\r\n)
# 3. The newline (\r\n)
# 4. The body: “Hello world! …”
