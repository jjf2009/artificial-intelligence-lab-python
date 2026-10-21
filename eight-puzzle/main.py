GOAL = (1, 2, 3,
        4, 5, 6,
        7, 8, 0)


def heuristic(state):
    return sum(tile != goal and tile != 0 for tile, goal in zip(state, GOAL))


def neighbours(state):
    blank = state.index(0)
    row = blank // 3
    col = blank % 3
    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    result = []

    for dr, dc in moves:
        new_row = row + dr
        new_col = col + dc

        if 0 <= new_row < 3 and 0 <= new_col < 3:
            new_blank = new_row * 3 + new_col
            next_state = list(state)
            next_state[blank], next_state[new_blank] = (
                next_state[new_blank], next_state[blank]
            )
            result.append(tuple(next_state))

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
            return None

        state = best
        visited.add(state)
        path.append(state)

    return path


def show(state):
    for row in range(0, 9, 3):
        print(" ".join(str(tile) if tile else "_" for tile in state[row:row + 3]))


if __name__ == "__main__":
    start = (1, 2, 3,
             4, 0, 6,
             7, 5, 8)

    path = hill_climbing(start)

    if path is None:
        print("Hill climbing got stuck before reaching the goal.")
    else:
        for move, state in enumerate(path):
            print(f"Move: {move} (H={heuristic(state)}):")
            show(state)
            print()
