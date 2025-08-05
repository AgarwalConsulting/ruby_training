require 'eventmachine'

module EchoServer
  def receive_data(data)
    send_data "You said: #{data}"
  end
end

EM.run do
  EM.start_server '127.0.0.1', 3000, EchoServer
  puts "Echo server on port 3000"
end

# nc 127.0.0.1 3000
