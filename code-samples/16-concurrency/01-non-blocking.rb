# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-i-cj3
require 'thwait'
require 'pg'

start = Time.now

first_sleep = Thread.new do
  puts 'Starting sleep 1'
  conn = PG::Connection.open(dbname: 'template1')
  conn.exec('SELECT pg_sleep(1);')
  puts 'Finished sleep 1'
end

second_sleep = Thread.new do
  puts 'Starting sleep 2'
  conn = PG::Connection.open(dbname: 'template1')
  conn.exec('SELECT pg_sleep(1);')
  puts 'Finished sleep 2'
end

random = Thread.new do
  puts 'In a random thread'
end

ThWait.all_waits(first_sleep, second_sleep, random)

puts "Time it took: #{Time.now - start}"
