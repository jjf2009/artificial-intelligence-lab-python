import random


def f(x):
    return -pow(x, 2) + 5


def neighbours(x, step):
    return x - step, x + step


def steepest_ascent(start, step=0.1):
    x = start
    print(f"start: x={x:.4f}, f(x)={f(x):.4f}")
    while True:
        n1, n2 = neighbours(x, step)
        best = max((n1, n2), key=f)
        if f(best) > f(x):
            x = best
            print(f"step:  x={x:.4f}, f(x)={f(x):.4f}")
        else:
            return x


def random_restart(step=0.1, restarts=5, low=-10, high=10):
    best_x = None
    for r in range(1, restarts + 1):
        start = random.uniform(low, high)
        peak = steepest_ascent(start, step)
        print(f"restart {r}: start={start:.4f} -> peak x={peak:.4f}, f={f(peak):.4f}\n")
        if best_x is None or f(peak) > f(best_x):
            best_x = peak
    return best_x


if __name__ == "__main__":
    print("=== Steepest-Ascent Hill Climbing ===")
    print("Peak found at x =", round(steepest_ascent(3), 4))

    print("\n=== Random-Restart Hill Climbing ===")
    best = random_restart()
    print("Best peak over all restarts at x =", round(best, 4))
