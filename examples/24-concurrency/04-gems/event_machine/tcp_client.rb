require 'eventmachine'

module EchoClient
  def post_init
    send_data "Hello Server"
  end

  def receive_data(data)
    puts "Got reply: #{data}"
    send_data "Hello, 1"
    # close_connection
    EM.stop
  end
end

EM.run do
  EM.connect '127.0.0.1', 3000, EchoClient
end
