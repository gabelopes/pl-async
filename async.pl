:- module(async, [
  await/1,
  await/2,
  '=>'/2,
  op(900,  fx, await),
  op(800, xfy, '=>')
]).

await(Pattern => Goals) :- !,
  await(Pattern, Goals).

await(Pattern, Goals) :- !,
  launch(Pattern, Goals, Threads),
  join(Pattern, Threads).

'=>'(Await, Goals) :- !,
  await(Await, Goals).

launch(_, [], _) :- !.
launch(Pattern, [Goal|Goals], [Thread|Threads]) :- !,
  thread_create((call(Goal), throw(unify(Pattern))), Thread, [detached=false]),
  launch(Pattern, Goals, Threads).

join(_, []) :- !.
join(Pattern, [Thread|Threads]) :- !,
  thread_join(Thread, Status),
  (
    Status = exception(unify(Pattern)) ->
      join(Pattern, Threads);
      throw(Status)
  ).
