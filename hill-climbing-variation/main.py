def f(x, y):
    return -pow(x, 2) + 2 * y + 20


def neighbours(x, y, step):
    return [
        (x - step, y),
        (x + step, y),
        (x, y - step),
        (x, y + step),
    ]


def steepest_ascent(start, step=0.1, max_iters=100):
    x, y = start
    print(f"start: x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")
    for _ in range(max_iters):
        best = max(neighbours(x, y, step), key=lambda p: f(*p))
        if f(*best) > f(x, y):
            x, y = best
            print(f"step:  x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")
        else:
            break
    return x, y


def stochastic_hill_climbing(start, step=0.1, max_iters=10):
    x, y = start
    print(f"start: x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")
    for _ in range(max_iters):
        best = max(neighbours(x, y, step), key=lambda p: f(*p))
        if f(*best) > f(x, y):
            x, y = best
            print(f"step:  x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")
        else:
            break
    return x, y


if __name__ == "__main__":
    print("Steepest-Ascent Hill Climbing")
    peak = steepest_ascent((3, 0))
    print("Peak:", tuple(round(c, 4) for c in peak), "f =", round(f(*peak), 4))

    print("\nStochastic Hill Climbing")
    peak = stochastic_hill_climbing((3, 0))
    print("Peak:", tuple(round(c, 4) for c in peak), "f =", round(f(*peak), 4))
