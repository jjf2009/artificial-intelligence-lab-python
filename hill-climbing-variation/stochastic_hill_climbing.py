import random


def f(x, y):
    return -x ** 2 + 2 * y + 20


def neighbours(x, y, step):
    return [
        (x - step, y),
        (x + step, y),
        (x, y - step),
        (x, y + step),
    ]


def stochastic_hill_climbing(start, step=0.1, max_iters=10):
    x, y = start
    print(f"start: x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")

    for _ in range(max_iters):
        better = [
            point for point in neighbours(x, y, step)
            if f(*point) > f(x, y)
        ]

        if not better:
            break

        x, y = random.choice(better)
        print(f"step:  x={x:.4f}, y={y:.4f}, f={f(x, y):.4f}")

    return x, y


if __name__ == "__main__":
    print("\nStochastic Hill Climbing")
    peak = stochastic_hill_climbing((3, 0))
    print("Peak:", tuple(round(c, 4) for c in peak),
          "f =", round(f(*peak), 4))
