require 'net/http'

urls = ['https://example.com', 'https://example.org']

threads = urls.map do |url|
  Thread.new do
    Net::HTTP.get(URI(url))
  end
end

results = threads.map(&:value)
