require 'sinatra'
require 'benchmark'

#set server: :unicorn

get '/hello' do
  puts "Received request!"
  puts "Doing work!"

  m = Benchmark.measure do
    10_000.times do |i|
      10_000.times do |j|
        i * j
      end
    end
  end

  p "Generating response: ", m

  "Response: #{m}"
end
