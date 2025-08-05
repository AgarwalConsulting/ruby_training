def update(a)
  a << 11
end

primes = [1, 2, 3, 5, 7]

# primes.freeze

# update(primes)
# update(primes.dup)
update(primes.clone)

puts primes # ?
