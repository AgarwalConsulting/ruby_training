require 'open3'

Open3.popen2("cat") do |stdin, stdout, wait_thr|
  stdin.puts "Open3 input"
  stdin.close
  puts "Output: #{stdout.read}"
end
