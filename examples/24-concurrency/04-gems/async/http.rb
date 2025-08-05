require 'async'
require 'net/http'

Async do
  5.times.map do |i|
    Async do
      puts "Request #{i}"
      res = Net::HTTP.get(URI("https://httpbin.org/delay/1"))
      puts "Done #{i}"
    end
  end
end
