# Logical Inference by Resolution (Prolog)

**AI Lab — Experiment 10: Logical inference using Resolution in Prolog.**

`resolution.pl` shows how Prolog proves goals by **SLD-resolution** — a
refutation procedure that repeatedly resolves a goal against Horn clauses until
it derives the empty clause. The knowledge base encodes the classic syllogism
and related rules.

## Knowledge base

```prolog
man(socrates).                 % fact
mortal(X) :- man(X).           % every man is mortal
philosopher(X) :- greek(X), man(X).
fallible(X) :- philosopher(X).
```

Query `?- mortal(socrates).` succeeds because `mortal(socrates)` resolves with
`mortal(X) :- man(X)` and then with the fact `man(socrates)`, reaching the empty
clause. `?- mortal(zeus).` fails — no chain of resolutions closes.

## Run

Requires [SWI-Prolog](https://www.swi-prolog.org/). The file runs a `demo` on
load:

```bash
swipl resolution.pl
```

Or try the queries interactively — `?- mortal(socrates).`, `?- fallible(X).`,
`?- mortal(zeus).` — to watch resolution succeed and fail.
