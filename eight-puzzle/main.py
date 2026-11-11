GOAL = (1, 3, 2,
        5, 0, 7,
        8, 4, 6)


def heuristic(state):
    """Number of misplaced tiles (blank not counted)."""
    return sum(tile != goal and tile != 0 for tile, goal in zip(state, GOAL))


def neighbours(state):==
    blank = state.index(0)
    row, col = divmod(blank, 3)
    result = []
    for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
        nr, nc = row + dr, col + dc
        if 0 <= nr < 3 and 0 <= nc < 3:
            nb = nr * 3 + nc
            nxt = list(state)
            nxt[blank], nxt[nb] = nxt[nb], nxt[blank]
            result.append(tuple(nxt))
    return result


def hill_climbing(start):
    state = tuple(start)
    path = [state]
    visited = {state}
    while state != GOAL:
        choices = [s for s in neighbours(state) if s not in visited]
        if not choices:
            return None
        best = min(choices, key=heuristic)
        if heuristic(best) >= heuristic(state):
            return None          # stuck at local optimum / plateau
        state = best
        visited.add(state)
        path.append(state)
    return path


def show(state):
    for r in range(0, 9, 3):
        print(" ".join(str(t) if t else "_" for t in state[r:r + 3]))


if __name__ == "__main__":
    start = (3, 2, 0,
             1, 4, 7,
             5, 8, 6)

    print("Start state:")
    show(start)
    print("\nGoal state:")
    show(GOAL)
    print()

    path = hill_climbing(start)
    if path is None:
        print("Hill climbing got stuck before reaching the goal.")
    else:
        for move, state in enumerate(path):
            print(f"Move: {move} (H={heuristic(state)}):")
            show(state)
            print()
        print(f"Goal state achieved in {len(path) - 1} moves!")