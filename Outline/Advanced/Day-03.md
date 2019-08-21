# Day 3

* Concurrency vs Parallelism
  * Threads - `Thread.new`
    * Green Threads
  * [`concurrent-ruby`](https://github.com/ruby-concurrency/concurrent-ruby)
  * Processes - `spawn`
* GC
  * `< 2.0`
  * `jruby`
  * `> 2.2`
    * Tuning
* Memory
  * CoW
* Debugging, memory management and performance analysis
  * Built-In
    * `benchmark`
    * `GC`
    * `objectspace`
  * Third-party
    * `memory-profiler` or `ruby-prof`
    * `derailed_benchmarks`
    * `valgrind`
    * `new_relic` or `wavefront`
* Misc
  * [`parallel`](https://github.com/grosser/parallel)
  * logging
    * `Rails.logger`
  * `warbler`
  * Resque vs Sidekiq
  * Unicorn vs Puma
  * rack
  * capistrano
  * sorbet

## Other readings

* [Ruby concurrency & parallelism](https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer)
* [MRI memory allocation](https://www.engineyard.com/blog/mri-memory-allocation-a-primer-for-developers)
* [What's the deal with Ruby GC and copy-on-write](https://medium.com/@rcdexta/whats-the-deal-with-ruby-gc-and-copy-on-write-f5eddef21485)
* [CoW, GC, Ruby 2.0](http://patshaughnessy.net/2012/3/23/why-you-should-be-excited-about-garbage-collection-in-ruby-2-0)
* [How does ruby garbage collection work](https://stackify.com/how-does-ruby-garbage-collection-work-a-simple-tutorial/)
* [JRuby GC](https://medium.com/@richardsondx/everything-you-should-know-about-the-obscure-world-of-jruby-jruby-with-ruby-on-rails-c3c90d8fdeec)
* [MRI vs jRuby vs Rubinius](https://www.rubyguides.com/2016/10/mri-vs-jruby-vs-rubinius/)
* [jRuby 9000](http://blog.jruby.org/2015/07/jruby_9000/)
* [Moving an existing app to jRuby](https://devcenter.heroku.com/articles/moving-an-existing-rails-app-to-run-on-jruby)
* [Java and jRuby example](https://github.com/jruby/jruby/wiki/JRubyAndJavaCodeExamples)
* [Performance tuning jruby](https://github.com/jruby/jruby/wiki/PerformanceTuning)
* [Ruby Memory Model](https://docs.google.com/document/d/1pVzU8w_QF44YzUCCab990Q_WZOdhpKolCIHaiXG-sPw)
* [Valgrind and ruby](https://blog.evanweaver.com/2008/02/05/valgrind-and-ruby/)
* [Variable hoisting](https://ieftimov.com/post/variable-hoisting-ruby/)
* [Strings >23 chars](http://patshaughnessy.net/2012/1/4/never-create-ruby-strings-longer-than-23-characters)
