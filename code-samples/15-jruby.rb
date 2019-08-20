require 'logging'

logger = Logging.logger(STDOUT)

if RUBY_PLATFORM == "java"
  java_import 'java.lang.System'

  System.out.println "Hello, World from jRuby!"
else
  logger.info "Using MRI"
end
