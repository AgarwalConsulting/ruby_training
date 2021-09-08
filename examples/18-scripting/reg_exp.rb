#!/usr/bin/ruby

## https://www.rubyguides.com/2015/06/ruby-regex/

line1 = "Cats are smarter than dogs";
line2 = "Dogs also like meat";

if ( line1 =~ /Cats(.*)/ )
   puts "Line1 contains Cats"
end
if ( line2 =~ /Cats(.*)/ )
   puts "Line2 contains  Dogs"
end


# Find the word 'like'
"Do you like cats?" =~ /like/

if "Do you like cats?".match(/like/)
  puts "Match found!"
end

## Character classes

def contains_vowel(str)
  str =~ /[aeiou]/
end
contains_vowel("test") # returns 1
contains_vowel("sky")  # returns nil

## Ranges

def contains_number(str)
  str =~ /[0-9]/
end
contains_number("The year is 2015")  # returns 12
contains_number("The cat is black")  # returns nil

## Modifiers

# +	              -       1 or more
# *	              -       0 or more
# ?	              -       0 or 1
# {3,5}	          -       between 3 and 5

def ip_address?(str)
  # We use !! to convert the return value to a boolean
  !!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
end
ip_address?("192.168.1.1")  # returns true
ip_address?("0000.0000")    # returns false

## Exact matches

# We want to find if this string is exactly four letters long, this will
# still match because it has more than four, but it's not what we want.
"Regex are cool".match /\w{4}/
# Instead we will use the 'beginning of line' and 'end of line' modifiers
"Regex are cool".match /^\w{4}$/
# This time it won't match. This is a rather contrived example, since we could just
# have used .size to find the length, but I think it gets the idea across.

## Capture groups

Line = Struct.new(:time, :type, :msg)
LOG_FORMAT = /(\d{2}:\d{2}) (\w+) (.*)/
def parse_line(line)
  line.match(LOG_FORMAT) { |m| Line.new(*m.captures) }
end
parse_line("12:41 INFO User has logged in.")

## Look Ahead & Look Behind

# (?=pat)	       -       Positive lookahead
# (?<=pat)	     -       Positive lookbehind
# (?!pat)	       -       Negative lookahead
# (?<!pat)	     -       Negative lookbehind

def number_after_word?(str)
  !!(str =~ /(?<=\w) (\d+)/)
end
number_after_word?("Grade 99")
