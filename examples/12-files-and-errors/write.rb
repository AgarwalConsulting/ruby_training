require 'time'

# f = File.open("/tmp/forbidden/unicorn", mode: "w")

# f << "Hello, World! #{Time.now}"

# f.close()

begin
  File.open("/tmp/forbidden/unicorn", mode: "w") do

    f << "Hello, World! #{Time.now}"

  end

  # File.open("/tmp/this file doesn't exists", mode: "r") do
  # end

rescue Errno::EACCES => e

  puts "Notifying the server team...", e.class.name, e.backtrace

ensure
  puts "Clean up..."
end
