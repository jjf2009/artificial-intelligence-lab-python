# Hill Climbing

**AI Lab — Experiment 5: Simple Hill Climbing.**

`main.py` implements simple (steepest-ascent by first improvement) hill climbing
to maximise a continuous objective function `f(x) = -x² + 5`, whose peak is at
`x = 0`.

## How it works

- Start at some `x` and pick a fixed `step` (0.1).
- Look at the two neighbours `x - step` and `x + step`.
- Move to the first neighbour that has a **higher** `f` value than the current
  point; repeat.
- Stop when neither neighbour improves — a **local optimum** has been reached.

Hill climbing is a local search: it keeps only the current state and never
backtracks. It can get stuck on local maxima, plateaus, or ridges, and the
result depends on the starting point and step size.

## Run

```bash
python3 main.py
```

Starts at `x = 3` and climbs toward the peak, printing each improving step.

## Complexity

Time is `O(k)` where `k` is the number of improving steps taken (roughly
`start / step`). Space is `O(1)` — only the current point is stored.
