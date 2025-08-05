require 'eventmachine'
require 'em-http-request'

urls = %w[
  https://httpbin.org/delay/1
  https://httpbin.org/delay/1
  https://httpbin.org/delay/1
]

EM.run do
  remaining = urls.size

  urls.each_with_index do |url, i|
    http = EM::HttpRequest.new(url).get

    http.callback do
      puts "Request #{i} got #{http.response.bytesize} bytes"
      EM.stop if (remaining -= 1) == 0
    end

    http.errback do
      puts "Request #{i} failed"
      EM.stop if (remaining -= 1) == 0
    end
  end
end
