# Credits: https://dev.to/enether/working-with-multithreaded-ruby-part-ii-5e3
require 'thwait'

item_accessories = {}
item = {}
item_acc_lock = Mutex.new
item_lock = Mutex.new
cv = ConditionVariable.new

a = Thread.new {
  item_acc_lock.synchronize {
    sleep 1  # pretend to work on item_accessories
    # At this point, we've just finished work on item_accessories and we're at a window where we
    #   might not care if item_accessories changes. So: let somebody else take it and give it back
    cv.wait(item_acc_lock)  # Temporarily sleeps the thread and releases the lock
    puts 'Gained back access to item_acc_lock'  # on this line, item_acc_lock is re-acquired
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
    cv.signal
    puts "I'm still working, but I'm finished with item_acc_lock"
  }
}

ThWait.all_waits(a, b)
