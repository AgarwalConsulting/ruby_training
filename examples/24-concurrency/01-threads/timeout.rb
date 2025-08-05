require 'timeout'

Timeout.timeout(5) do
  # This block must finish in 5 seconds
  do_something_slow
end
