# listen gem is the most reliable cross-platform wrapper for filesystem events, supporting:

# macOS → FSEvents
# Linux → inotify
# Windows → WDM

# ```bash
# gem install listen
# ```

require 'listen'

# Change this to an array of files or directory paths you want to monitor
paths_to_watch = ['watched1.txt', 'watched2.txt']
audit_log = 'audit.log'

listener = Listen.to(*paths_to_watch.map { |f| File.dirname(f) }) do |modified, added, removed|
  (modified + added + removed).each do |file|
    if paths_to_watch.include?(file)
      puts "Change detected in: #{file}"
      File.open(audit_log, 'a') do |log|
        log.puts "[#{Time.now}] Change detected in: #{file}"
      end
    end
  end
end

listener.start
puts "Watching #{paths_to_watch.join(', ')}..."
sleep
