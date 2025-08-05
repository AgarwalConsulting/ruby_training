IO.popen("cat", "r+") do |io|
  io.puts "Hello stdin"
  io.close_write
  puts "Output: #{io.read}"
end
