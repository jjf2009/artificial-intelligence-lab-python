# Water Jug Problem

**AI Lab — Experiment 1: Classical AI problem (state-space search).**

Two unlabelled jugs of capacity `m` and `n` litres and an unlimited water
supply. Starting from both jugs empty, reach a state where either jug holds
exactly `d` litres. `main.py` solves it with both **BFS** and **DFS** over the
state space and reports the number of steps in the shortest solution found.

## State space

A state is the pair `(a, b)` = water in jug 1, jug 2. From any state the six
allowed moves are:

| Move | Result |
|---|---|
| Fill jug 1 | `(m, b)` |
| Fill jug 2 | `(a, n)` |
| Empty jug 1 | `(0, b)` |
| Empty jug 2 | `(a, 0)` |
| Pour 1 → 2 | `(a - t, b + t)`, `t = min(a, n - b)` |
| Pour 2 → 1 | `(a + t, b - t)`, `t = min(b, m - a)` |

A `visited` matrix of size `(m+1) × (n+1)` prevents revisiting states. BFS uses a
`deque` (FIFO) and returns the fewest steps; DFS uses a stack (LIFO). The goal is
returned as a step count, or `-1` if unreachable (e.g. `d > max(m, n)`).

## Run

```bash
python3 main.py
```

Defaults: `jug1 = 5`, `jug2 = 3`, target `d = 2`. Edit the three variables at the
bottom of `main.py` to try other capacities.

## Complexity

`O(m * n)` states, each expanded once, so time and space are both `O(m * n)`.
BFS gives the optimal (fewest-move) solution; DFS gives *a* solution, not
necessarily the shortest.
