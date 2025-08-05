require 'webrick'

server = WEBrick::HTTPServer.new(
  Port: 8080,
  BindAddress: '127.0.0.1'
)

# Simple handler
server.mount_proc '/ping' do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/plain'
  res.body = "pong at #{Time.now}"
end

# Trap SIGINT for clean shutdown
trap("INT") { server.shutdown }

# Start server (blocking)
server.start
