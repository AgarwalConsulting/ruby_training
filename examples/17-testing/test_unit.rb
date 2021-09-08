require "test/unit/assertions"

include Test::Unit::Assertions

hello = 'world'

assert_equal 'world', hello, "hello function should return 'world'"

flunk "throw a failure message"
