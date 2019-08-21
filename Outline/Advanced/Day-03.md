# Day 3

* Concurrency vs Parallelism
  * Threads - `Thread.new`
    * Green Threads
  * [`concurrent-ruby`](https://github.com/ruby-concurrency/concurrent-ruby)
  * Processes - `spawn`
* Memory
  * CoW
* GC
  * `< 2.0`
  * `jruby`
  * `> 2.2`
  * Tuning
* Debugging, memory management and performance analysis
  * `benchmark`
  * `GC`
  * `memory-profiler`
  * `derailed_benchmarks`
  * `valgrind`
  * `new_relic`
* Misc
  * [`parallel`](https://github.com/grosser/parallel)
  * logging
    * `Rails.logger`
  * `warbler`
  * Resque vs Sidekiq
  * Unicorn vs Puma
  * capistrano

## Other readings

* [Ruby concurrency & parallelism](https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer)
* [MRI memory allocation](https://www.engineyard.com/blog/mri-memory-allocation-a-primer-for-developers)
* [What's the deal with Ruby GC and copy-on-write](https://medium.com/@rcdexta/whats-the-deal-with-ruby-gc-and-copy-on-write-f5eddef21485)
* [How does ruby garbage collection work](https://stackify.com/how-does-ruby-garbage-collection-work-a-simple-tutorial/)
* [MRI vs jRuby vs Rubinius](https://www.rubyguides.com/2016/10/mri-vs-jruby-vs-rubinius/)
* [jRuby 9000](http://blog.jruby.org/2015/07/jruby_9000/)
* [Moving an existing app to jRuby](https://devcenter.heroku.com/articles/moving-an-existing-rails-app-to-run-on-jruby)
* [Java and jRuby example](https://github.com/jruby/jruby/wiki/JRubyAndJavaCodeExamples)
