require 'pry'
require 'thread'
require 'thwait'

indices = []

all_threads = 100.times.map do |index|
  Thread.new do
    indices << index
    puts "Hello, World from #{index} thread!"
  end
end

puts "Hello, World from main thread!"

ThWait.all_waits(*all_threads)

puts "Indices.count: #{indices.count}"
