# A* Search

**AI Lab — Experiment 7: A\* search algorithm.**

`main.py` implements A\* search, which expands the node with the smallest
`f(n) = g(n) + h(n)` — the actual cost from the start `g(n)` plus the heuristic
estimate to the goal `h(n)`. Combining both makes A\* both informed and optimal
(unlike greedy [best-first search](../best-first-search), which uses `h` alone).

## How it works

- `open_list` is a min-heap of `(f, g, vertex)`.
- `g_score` holds the cheapest known cost to each vertex; `parent` reconstructs
  the path.
- When a vertex is popped, stale heap entries (a cheaper path was found after
  queuing) are skipped. This **reopening** keeps A\* optimal even when the
  heuristic is admissible but not consistent.

With an **admissible** heuristic (never overestimates), A\* returns the
lowest-cost path.

## Run

```bash
python3 main.py
```

The graph stores `(neighbour, edge_cost)` pairs; the example finds the least-cost
path `S → G`.

## Complexity

`O(E log V)` with a binary heap. Optimality and completeness require an
admissible heuristic.
