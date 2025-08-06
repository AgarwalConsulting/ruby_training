require 'eventmachine'
require 'em-http-request'

EM.run do
  http = EM::HttpRequest.new('https://google.com').get

  http.callback do
    puts "Got response: #{http.response[0..50]}..."
    EM.stop
  end

  http.errback do
    puts "HTTP request failed"
    EM.stop
  end
end
