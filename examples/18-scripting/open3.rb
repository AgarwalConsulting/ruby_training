require 'open3'

Open3.popen3("curl http://example.com") do |stdin, stdout, stderr, thread|
   pid = thread.pid
   puts stdout.read.chomp
end
