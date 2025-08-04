require 'socket'

# s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
# s.connect Socket.pack_sockaddr_in(2000, 'localhost')

TCPSocket.open('localhost', 2000) do |s|
  # s.send "GET / HTTP/1.0\r\n\r\n", 0
  # s.puts "GET / HTTP/1.0\r\n\r\n",
  s.sendmsg "Some Request...\n"

  # s.send("Some Request!")
  p s.read
end

# # s << "Some Request!"


# while line = s.gets # Read lines from socket
#   puts line         # and print them
# end

# s.close             # close socket when done
