# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-ii-5e3
require 'thwait'

item_accessories = {}
item = {}
item_acc_lock = Mutex.new
item_lock = Mutex.new

a = Thread.new {
  item_acc_lock.synchronize {
    sleep 1  # pretend to work on item_accessories
    item_lock.synchronize {
      # pretend to work on item
      sleep 1
      puts 'Worked on accessories, then on item'
    }
  }
}

b = Thread.new {
  item_lock.synchronize {
    sleep 1  # pretend to work on item
    item_acc_lock.synchronize {
      # pretend to work on item_accessories
      sleep 1
      puts 'Worked on item, then on accessories'
    }
  }
}

ThWait.all_waits(a, b)
