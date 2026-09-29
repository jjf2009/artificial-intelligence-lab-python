# Hill Climbing — Variations

**AI Lab — Experiment 6: A variation of the Hill Climbing algorithm.**

`main.py` implements two variations that address the local-optimum weakness of
[simple hill climbing](../hill-climbing), on the same objective `f(x) = -x² + 5`.

## Variations

- **Steepest-ascent hill climbing** — instead of moving to the *first* improving
  neighbour, it evaluates *all* neighbours and moves to the **best** one.
- **Random-restart hill climbing** — runs steepest-ascent from several random
  starting points and keeps the best peak found, making it far more likely to
  escape a poor local optimum.

## Run

```bash
python3 main.py
```

Prints each climb, then the best peak across all restarts.

## Complexity

Each climb is `O(k)` in the number of improving steps; random-restart multiplies
that by the number of restarts. Space is `O(1)`.
