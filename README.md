tqueue (Tim's Queue)
====================

A little queue library for fun.

It implements a simple API:

    new() -> NewQueue

        Returns a new queue.  It should be considered opaque outside
        of the tqueue module.

    in(Queue, Item) -> NewQueue

        Insert an item into the back of the queue and returns the new
        queue.

    out(Queue) -> {ok, NewQueue, Item} | {empty, Queue}
        
        Remove an item from the front of the queue and return the new
        queue and item.  If there are no items, it returns the empty
        atom and the unmodified queue.

    len(Queue) -> integer()

        Returns the number of items in the queue.
