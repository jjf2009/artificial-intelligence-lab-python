# Best-First Search

**AI Lab — Experiment 4: Greedy Best-First Search.**

`main.py` implements greedy best-first search: an informed search that always
expands the open node with the smallest **heuristic** value `h(n)` — the
estimated distance to the goal — ignoring the cost already paid to reach it.

## How it works

- `open_list` is a min-heap of `(h, vertex)` ordered by heuristic.
- `closed_list` maps each expanded vertex to its parent, so the path can be
  reconstructed once the goal is popped.
- On each step the cheapest-heuristic node is popped; its unseen neighbours are
  pushed with their heuristic values and recorded with their parent.

Because it trusts the heuristic completely, best-first search is fast but **not
optimal** — the path returned need not be the shortest.

## Run

```bash
python3 main.py
```

The example searches `S → E` on a directed graph with the classic heuristic
table and prints the discovered path.

## Complexity

With a heap, `O(E log V)` time and `O(V)` space. Optimality and completeness
depend entirely on the heuristic supplied.
