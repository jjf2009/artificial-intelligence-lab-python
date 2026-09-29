# Eight Puzzle (A* Game Playing)

**AI Lab — Experiment 8: Game-playing algorithm for the eight-puzzle.**

`main.py` solves the 8-puzzle — a 3×3 sliding-tile board with one blank — by
searching the state space with A\* and the **Manhattan distance** heuristic.

## How it works

- A state is a 9-tuple; `0` is the blank. The goal is `(1..8, 0)`.
- `manhattan(state)` sums each tile's grid distance from its goal position — an
  admissible, consistent heuristic.
- `neighbours(state)` slides the blank up/down/left/right.
- `solve(start)` runs A\* with `f = g + h` (`g` = moves so far) and reconstructs
  the shortest move sequence, which is printed board by board.

## Run

```bash
python3 main.py
```

Edit `start` in `main.py` to try other configurations. Half of all 8-puzzle
positions are unsolvable (wrong parity); the solver reports those.

## Complexity

Exponential in the worst case, but the Manhattan heuristic prunes the search
heavily. The 8-puzzle state space has `9!/2 = 181,440` reachable states.
