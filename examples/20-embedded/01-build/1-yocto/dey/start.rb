#!/usr/bin/env ruby
puts "✅ Ruby #{RUBY_VERSION} running with YJIT: #{RubyVM::YJIT.enabled?}"
