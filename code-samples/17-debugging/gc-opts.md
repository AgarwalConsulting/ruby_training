# GC Options

* RUBY_GC_HEAP_INIT_SLOTS: Initial allocation slots.

* RUBY_GC_HEAP_FREE_SLOTS: Prepare at least this amount of slots after GC. Allocate slots if there aren’t enough slots.

* RUBY_GC_HEAP_GROWTH_FACTOR: Allocate slots by this factor. (next slots number) = (current slots number) * (this factor)

* RUBY_GC_HEAP_GROWTH_MAX_SLOTS: The allocation rate is limited to this number of slots.

* RUBY_GC_HEAP_FREE_SLOTS_MIN_RATIO: Allocate additional pages when the number of free slots is lower than the value (total_slots * (this ratio)).

* RUBY_GC_HEAP_FREE_SLOTS_GOAL_RATIO: Allocate slots to satisfy this formula - free_slots = total_slots * goal_ratio. In other words, prepare (total_slots * goal_ratio) free slots. If this value is 0.0, then use RUBY_GC_HEAP_GROWTH_FACTOR directly.

* RUBY_GC_HEAP_FREE_SLOTS_MAX_RATIO: Allow to free pages when the number of free slots is greater than the value (total_slots * (this ratio)).

* RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR: Do full GC when the number of old objects is more than R * N where R is this factor and N is the number of old objects just after last full GC.
