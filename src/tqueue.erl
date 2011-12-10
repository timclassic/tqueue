-module(tqueue).

-export([new/0,
         in/2,
         out/1,
         len/1]).

-record(tqueue, {items = [],
                 len = 0}).

new() ->
    #tqueue{}.

in(Queue, Item) ->
    NewLen = Queue#tqueue.len + 1,
    NewList = Queue#tqueue.items ++ [Item],
    Queue#tqueue{len = NewLen, items = NewList}.

out(Queue) ->
    NewLen = Queue#tqueue.len - 1,
    case NewLen of
        -1 ->
            {empty, Queue};
        _Else ->
            [Item | NewList] = Queue#tqueue.items,
            {ok, Queue#tqueue{len = NewLen, items = NewList}, Item}
    end.

len(Queue) ->
    Queue#tqueue.len.
