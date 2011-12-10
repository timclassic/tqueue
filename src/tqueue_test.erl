-module(tqueue_test).

%% Avoid warnings and avoid eunit dependency when compiling without
%% TEST defined
-compile([export_all]).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%% Quick and dirty test
in_out_len_test() ->
    Q = tqueue:new(),

    Item1 = "Item One",
    Item2 = "item Two",
    Item3 = "item Three",

    0 = tqueue:len(Q),
    Q1 = tqueue:in(Q, Item1),
    1 = tqueue:len(Q1),
    Q2 = tqueue:in(Q1, Item2),
    2 = tqueue:len(Q2),
    Q3 = tqueue:in(Q2, Item3),
    3 = tqueue:len(Q3),

    {ok, Q4, Item1} = tqueue:out(Q3),
    2 = tqueue:len(Q4),
    {ok, Q5, Item2} = tqueue:out(Q4),
    1 = tqueue:len(Q5),
    {ok, Q6, Item3} = tqueue:out(Q5),
    0 = tqueue:len(Q6),

    {empty, Q6} = tqueue:out(Q6),

    ok.
