-module(tqueue).

-export([new/0,
         enqueue/2,
         dequeue/1]).

-record(tqueue, {items = [],
                 len = 0}).

new() ->
    #tqueue{}.

enqueue(Queue, Item) ->
    NewLen = Queue#tqueue.len + 1,
    NewList = lists:append(Queue#tqueue.items, [Item]),
    Queue#tqueue{len = NewLen, items = NewList}.

dequeue(Queue) ->
    NewLen = Queue#tqueue.len - 1,
    case NewLen of
        -1 ->
            {empty, Queue};
        _Else ->
            [Item | NewList] = Queue#tqueue.items,
            {ok, Queue#tqueue{len = NewLen, items = NewList}, Item}
    end.