require 'eventmachine'

module UdpHandler
  def receive_data(data)
    puts "Received: #{data}"
  end
end

EM.run do
  EM.open_datagram_socket('127.0.0.1', 4000, UdpHandler)
  puts "UDP server on port 4000"
end

# echo "hi" | nc -u 127.0.0.1 4000
