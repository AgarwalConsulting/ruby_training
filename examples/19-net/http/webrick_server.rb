require 'webrick'
# require 'pry'

server = WEBrick::HTTPServer.new(
  Port: 8080,
  BindAddress: '127.0.0.1'
)

# Simple handler
server.mount_proc '/ping' do |req, res|
  # binding.pry
  if req.request_method == "POST"
    body = req.body
    res.status = 200
    res['Content-Type'] = 'text/plain'
    res.body = "pong at #{Time.now} with #{body}"
  else
    res.status = 405
    res.body = "Unsupported method"
  end
end

# Trap SIGINT for clean shutdown
trap("INT") { server.shutdown }

# Start server (blocking)
server.start
